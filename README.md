# Infrastructure as Code with Terraform 
In this repository you can find the demo presented at the [Community Days 2021](https://communitydays.it/events/2021/) event. 

## Demos
Demos are grouped into different foldes:
- __Demo 1__: includes a Terraform file with all the code written in the same file to describe the infrastructure. The goal is to demonstrate the syntax and the basic commands like _terraform fmt_, _terraform init_, _terraform validate_ and _terraform apply_;
- __Demo 2__: includes the same Terraform code in a single file but with another resource to be deployed. The goal is to showcase how adding a new resource won't change the plan to re-deploy the entire infrastructure, but only the missing parts will be added during the planning and after when applied;
- __Demo 3__:  contains the same infrastructure code, but demonstrates the usage of modules to start splitting the content when infrastructure gets more complicated;
- __Demo 4__: with the same infrastructure code organized with modules, we're now adding variables and handling secrets in a better (and more secure) way. The same code is then used by the GitHub Action pipeline that will validate the code during PRs and will apply the newly created infrastructure (or updates) once PRs are merged back into main.  