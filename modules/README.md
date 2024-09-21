## Usage

This directory contains terraform modules which will be used as base-modules for the followings to create other custom modules on top of these.

- Base modules for diffrent environments.
- Base modules for specific resources.

**Why do we need these base-modules?**

Well there are following reasons:

- We might need to have some custom changes to all the resources (s3, vpc, etc) that we would like to deploy in our AWS infrastructure specific to our company, So by making changes to these base-modules directly we can iterate the same change across all the resources that we will create on top of these modules.

- What if we need to update version of any module in future, So by updating version of the needed module in this directory only we can update module version for all the modules that would be referencing the same module.

### Base modules for diffrent environments:

If you consider these modules as environmental base-modules then on top of these modules you can configure environmental terraform modules for the following environments by just referencing using `source` key word:

- dev
- staging
- prod

### Direct resource modules:

If you consider these modules as resource specific modules then you can directly create modules on top of these modules for resource like `s3` with name `s3-for-web-data-collection` (which is specific to usage)

**What are the benefits of creating resource specific base modules on top of base-modules?**

By creating resource specific modules based on base-modules we can have great track of terraform configurations. So, we can easily & eficiently manage resources individually in our AWS infrastructure.
