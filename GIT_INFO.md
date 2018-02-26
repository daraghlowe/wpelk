# Guide to using Github


**GETTING YOUR ACCOUNT SETUP**
* Create Github account
* Create an ssh key specifically for this account
`ssh-keygen -t rsa -C "your_email@youremail.com" -f ~/.ssh/id_rsa_[git_hub_user_here]`
* Activate/add the key
 `ssh-add ~/.ssh/id_rsa_[git_hub_user_here]`
* Check if the key is active
 `ssh-add -l`
* Add this to your ssh config so it uses the correct ssh key for github
```
 Host github.com
      Hostname ssh.github.com
      ForwardAgent no
      IdentityFile ~/.ssh/id_rsa_[git_hub_user_here]
      IdentitiesOnly yes
      Port 443
```
* Add your public key to your github account in settings
 `cat ~/.ssh/id_rsa_[git_hub_user_here].pub`
* Request access to the Github Repository from the owner


 **GIT COMMANDS**

*How to clone a repo (initial pull remote files locally)*
* Change directory into one you want to use for your code like ~/code/
* When you clone a repo, a new sub directory named "reponame" will be created.
* Get the command syntax from the Github site here:
![Alt text](https://monosnap.com/file/p8cn1VxneOc0FVx41ZtxXAkpiiiPa9.png)
* Clone the repo: `git clone git@github.com:daraghlowe/wpelk.git`

*How to create your branch*
* Change directory to the repo directory `cd ~/code/reponame`
* Check if there's any new updates (not needed if you just did the initial clone)
    ```
    git fetch #sync up remote changes to local
    git status #check status of changes on local and remote branches
    ```
* Push your code to your own branch
  * Create your own branch
  ```
    git checkout -b your_branch_name
  ```

* Push any local changes to the remote repo
```
    git branch #check which branch is active
    git push -u origin your_branch_name #push using your branch as the origin
```
* Push changes to your code to your own branch
```
    git fetch #sync up remote changes to local
    git status #check status of changes on local and remote branches
    git branch #confirm you are using correct branch
    git checkout your_branch_name #change to your branch(if required)
    git add . #add all changed files
    git add filename1 filename2 .. #add individual files (if you prefer to above)
    git rm filename1 filename2 .. #remove any files from the branch(if required)
    git mv filename1 filename2 #rename a file
    git commit -m "Description of changes" #stage the changes
    git push #push all changes
```

*Create a pull request to update master branch*
* 

*Other notes*
* You can create `readme.md` files to provide info on what your code is doing.
* You can create a `.gitignore` file to exclude any files you don't want to be pushed.
* You can see logs of all recent activity with `git log`
