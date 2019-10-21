# Cloud DevOps Security Summit 2019

This repository contains the source code for Eric Gerling's presentation
at the SANS Cloud DevOps Security Summit 2019.

*NOTE:* This is meant as example code only. The CIS example *does not*
implement the majority of the CIS Benchmark, but only a select few
examples to demonstrate test kitchen to test and validate compliance
requirements on AMIs prior to being rolled out to AWS accounts.

## Required for Setup

It is expected you have an AWS account and a Jenkins environment running
to utilize the examples in this repository.

You will need the following software installed on your local machine if
you are stepping through the process manually.

* packer version 1.4.3
  * https://releases.hashicorp.com/packer/1.4.3/
* chefdk version 4.3.13
  * https://downloads.chef.io/chefdk
* Chef Gems *chef gem install <GEM>*
  * berkshelf
  * inpsec
  * kitchen-ec2
  * kitchen-inspec
  * kitchen-sync
  * test-kitchen
  * foodcritic

You will need to edit the *ami/.kitchen.yml* file to update variables with
the appropriate values from your AWS account.

## Repository Layout

The AMI build process is in the `ami` directory.
