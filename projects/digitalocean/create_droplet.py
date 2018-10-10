import digitalocean
import argparse
import sys

apikey=""
manager = digitalocean.Manager(token=apikey)


def get_last_node(tag_name):
    try:
        node_list = manager.get_all_droplets(tag_name=tag_name)
        last_node = node_list[-1].name
    except IndexError:
        last_node = '{}{}'.format(tag_name[0], '-00')
    return last_node


def get_next_node(tag_name):
    last_node = get_last_node(tag_name)
    last_node_num = int(last_node.split("-")[-1])
    next_node_num = last_node_num + 1
    next_node = '{}{}{}'.format(tag_name[0], '-', format(next_node_num, '02d'))
    return next_node


def check_for_existing_node(tag_name, name):
    existing = False
    node_list = manager.get_all_droplets(tag_name=tag_name)
    for node in node_list:
        if node.name == name:
            existing = True
    return existing


def create_droplet(token, region, image, size, tags):
    name = get_next_node(tags)
    ssh_key_dlowe = manager.get_ssh_key("20978131")
    ssh_key_ansible = manager.get_ssh_key("22545571")
    ssh_keys = [ssh_key_dlowe, ssh_key_ansible]
    droplet = digitalocean.Droplet(token=token,
                                   name=name,
                                   region=region,
                                   image=image,
                                   size_slug=size,
                                   backups=False,
                                   tags=tags,
                                   ssh_keys=ssh_keys,
                                   )
    does_node_exist = check_for_existing_node(tags, name)
    if does_node_exist:
        print("Something went wrong, attempted to build {} but it already exists!".format(name))
        sys.exit(1)
    droplet.create()
    return name


def get_region_list():
    region_list = manager.get_all_regions()
    regions = ""
    for region in region_list:
        regions = '{} {}'.format(regions, region.slug)
    return regions


def main():
    parser = argparse.ArgumentParser(description='Digital Ocean Droplet Builder')
    regions = get_region_list()

    parser.add_argument(
        '-r',
        '--region',
        action='store',
        dest='region',
        default='60',
        help=regions
    )

    if len(sys.argv) < 2:
        parser.print_usage()
        sys.exit(1)

    args = parser.parse_args()

    image_id = "37208325"
    droplet_size = "s-1vcpu-1gb"
    tag_list = ["web"]

    print("Creating your droplet!")
    droplet = create_droplet(apikey, args.region, image_id, droplet_size, tag_list)
    print("Build complete for {}".format(droplet))


if __name__ == '__main__':
    main()
