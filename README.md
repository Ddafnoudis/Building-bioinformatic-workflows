### Building Basic Workflows

#### Day 1

Create the environments using **yaml files** and **conda**

```bash
conda create -f <yaml_name>.yml -n <env_name>
```



#### Day 2


 - Check if package exists in channels (bioconda)
 
 ```bash
 conda search <pagkage_name> -c bioconda 
 ```

#### Remove virtual environments created from yaml files

You need to type the *-p* that specifies a path, and the full path of the virtual environment
```bash
conda remove -p /envs/env_name --all
```


 ### Key takeaways

 1) Create different environments and install packages using yaml files.
 2) Create a workflow from running one script in **bash**.
 3) Connect the variables by defining them from the main script.
