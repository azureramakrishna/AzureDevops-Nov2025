Welcome to SAANVIK IT - Azure & AzureDevops Training!


zomato / swiggy / amazon / flipkart 


Timings: 9am -10am (10:30am)
Weekdays: Mon - Fri (saturday)
Daily recording 
Daily practice 
Troubleshooting - Post issues on chat 
Interview questions
Projects 
Certifications 
Sample resume 
Duration: 60days

Mock interviews / Interview support 
Job support


QA:
--



Agenda:
======
1. How to create Azure Free Trail Account 
    https://azure.microsoft.com
    Start Azure Free 

    ** NEW EMAIL ID
    ** NEW MOBILE NUMBER 
    ** NEW CC/DC

2. Demo to Azure Portal 


3. Azure services overview / Documentation


4. Azure pricing calculator

        abcd.com --> Datacenter (onprem)

        abcd.com --> Azure cloud 

        1. windows VM 
        2. Linux VM 
        3. Storage 
        4. SQL DB 
        5. Loadbalancing
        6. Security 

5. 


RBAC (Role based access control): Security Best practices
================================

1. Owner        - Full access to manage all resource, also ability to assing Azure RBAC.
2. Contributor  - Full access to manage all resource, but do have the ability to assing Azure RBAC.
3. Reader       - view only access

Custom Roles:


Network
Storage
DB
Compute 
etc



1. Azure Hierarchy

    Management Groups 
        \_
            Subscriptions
                \_
                    ResourceGroups 
                        \_
                            Resources 

2. Azure Tags 

    Shared Subscription:
        Tags: 
        
        Project: volvo 
        Project: Mercedes
        Project: Maruthi

3. Azure Poilies
    
    Project: EastUS & UK
    Ingerit the tags

4. Azure cost analysis

    Jan     1000$
    Feb     1300$
    March   1500$

5. Support ticket
    https://azure.microsoft.com/en-in/support/plans





IP Address (Internet Protocal):
==============================

IPv4 - 32bit        0.0.0.0 - 255.255.255.255
IPv6 - 128bit


000 - 111

001
010
011
100
101
110
111

ipconfig

ClassA  0.0.0.0     127.255.255.255
        10.0.0.0 – 10.255.255.255

ClassB  128.0.0.0   191.255.255.255
        172.16.0.0 – 172.31.255.255

ClassC  192.0.0.0   223.255.255.255
        192.168.0.0 – 192.168.255.255

ClassD  224.0.0.0   239.255.255.255

ClassE  240.0.0.0   255.255.255.255


CIDR:
----
10.0.0.0/16     = 2^32-16 = 2^16 = 65536 (5 Reserved IP) = 65531
172.16.0.0/24   = 2^32-24 = 2^8  = 256 (5 Reserved IP) = 251
192.168.0.0/25  =                = 128 (5 Reserved IP) = 123
10.0.0.0/27     =                = 32 (5 Reserved IP) = 27
10.0.0.0/29     =                = 8 (5 Reserved IP) = 3
10.0.0.0/30     =                = 4 



10.0.0.0/29 = 8

10.0.0.0    Network address.
10.0.0.1    Reserved by Azure for the default gateway.
10.0.0.2    Reserved by Azure to map the Azure DNS IP addresses to the virtual network space.
10.0.0.3    Reserved by Azure to map the Azure DNS IP addresses to the virtual network space.
10.0.0.4
10.0.0.5
10.0.0.6
10.0.0.7    Network broadcast address.


Azure Virtual Network:
=====================

project-region-env-resourcename-logicalnumber

volvo-eastus-dev-vnet-01



Azure VM:   
========

1. The names of your resources -->      volvo-eastus-dev-vm-01
2. The location where the resources are stored
3. The size of the virtual machine. --> Type of VMs
4. The maximum number of virtual machines that can be created
5. The operating system that the virtual machine runs
    Windows - windows server 2025, windows server 2022, window server 2019, windows server 2016
    Linux   - Ubuntu 24.04 LTS, RHEL 7, 8, 9. 
6. The configuration of the virtual machine after it starts 
    vistual studio, Java, .NET
7. The related resources that the virtual machine needs
    Datadisk, etc
8. Required access - RBAC   contributor
9. VNET Setup 


*** 

100 VMs - snapshot --> new vm

Availability set
    Fault Domain
    Update Domain 

Availability zone 


Windows OS Disk - 127GB
Linux OS Disk   - 30GB


Labs:

1. Create a Azure VNET 
2. Create a Azure VM - Windows 
3. Enble the webserver - IIS (Internet information services).    c:/inetpub/wwwroot/index.html
4. Host a sample application
5. Add a datadisk to VM

https://learn.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal


Azure Linux VM:
==============

Apache2         /var/www/http

Ubuntu - apt
RHEL - yum / dns

Clients:
=======

Mobaxterm 
GitBash 
Putty
WSL 


1. Create Azure Ubuntu VM 
2. Intall apache2
3. Host a sample website 
4. Login to Linux vm with different clients 
5. Practice linux commands.

https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal?tabs=ubuntu



How many ways we can create resources on Azure:
==============================================

1. Azure Portal 
2. Azure Powershell 

        Login-AzAccount -TenantId xxxxxxxxxxx -SubscriptionId xxxxxxxxxx
        Logout-AzAccount
        Connect-AzAccount 
        Disconnect-AzAccount 

        New-AzResourceGroup -Name 'powershell' -Location 'UK South'

        Get-AzResourceGroup 

        Remove-AzResourceGroup -Name powershell -Force
    

3. Azure CLI 

        az login --tenant xxxxxxxx
        az logout

        az group create --name cli --location eastus
        az group create -n cli -l eastus

        az group list 

        az group delete -n cli -y 

4. ARM Templates
5. Bicep
6. Terraform




Azure Storage Accounts:
======================

Types of Azure storage:
======================
1. Standard general-purpose v2      Blob Storage, Queue Storage, Table Storage, and Azure Files
2. Premium block blobs              Blob Storage (including Data Lake Storage1)
3. Premium file shares              Azure Files
4. Premium page blobs               Page blobs only


Azure storage service types:
===========================
1. Blob (Binary large object)
    - Page blob
    - Append blob 
    - Block blob
2. Fileshare
3. Queues
4. Table


Endpoints:
Storage service	                Endpoint
===============                 ========
Blob Storage	                https://<storage-account>.blob.core.windows.net
Static website (Blob Storage)	https://<storage-account>.web.core.windows.net
Data Lake Storage	            https://<storage-account>.dfs.core.windows.net
Azure Files	                    https://<storage-account>.file.core.windows.net
Queue Storage	                https://<storage-account>.queue.core.windows.net
Table Storage	                https://<storage-account>.table.core.windows.net


Azure Storage redundancy:
========================
1. LRS - Locally-redundant storage              3 copies in primary region
2. ZRS - Zone-redundant storage                 3 copies and each copy in diff AZ
3. GRS - Geo-redundant storage                  6 copies, 3 in primary and 3 in secondary regions
4. RA-GRS - Read-access geo-redundant storage   6 copies, 3 in primary and 3 in secondary regions. will have read access to secondary region
5. GZRS - Geo-zone-redundant storage            6 copies, 3 in primary ZRS and 3 in secondary regions LRS
6. RA-GZRS - Read-access geo-zone-redundant storage 6 copies, 3 in primary ZRS and 3 in secondary regions LRS. will have read access to secondary region


Performance:
===========
1. Standard
2. Premium

Access tiers:
============
1. Hot
2. Cool
3. Cold 
4. Archive

Hot tier - An online tier optimized for storing data that is accessed or modified frequently. The hot tier has the highest storage costs, but the lowest access costs.
Cool tier - An online tier optimized for storing data that is infrequently accessed or modified. Data in the cool tier should be stored for a minimum of 30 days. The cool tier has lower storage costs and higher access costs compared to the hot tier.
Cold tier - An online tier optimized for storing data that is rarely accessed or modified, but still requires fast retrieval. Data in the cold tier should be stored for a minimum of 90 days. The cold tier has lower storage costs and higher access costs compared to the cool tier.
Archive tier - An offline tier optimized for storing data that is rarely accessed, and that has flexible latency requirements, on the order of hours. Data in the archive tier should be stored for a minimum of 180 days.


Life cycle management: Blob
=====================

Access Keys 

SAS - Shared acces signature

Static website hosting


Azure Fileshare:
===============

SMB 445

Queues:
======

Migrate or move the between storage accounts:
-==========================================

Azure Storage exploere
AzCopy 



Azure Virtual Network connectivities:
====================================

1. VNET Peering 

    - Regional VNET Peering     (VNET1 & VNET2 same region ex: EastUS)
    - Global VNET Peering       (VNET1 Eastus & VNET2 UKSouth)

    Pre-requisite: IPs shouldn't overlap
    =============
    VNET01 - 10.0.0.0/16        10.0.0.0 - 10.0.255.255
    VNET02 - 10.0.0.0/24        10.0.0.0 - 10.0.0.255


    VNET01 - 10.0.0.0/24        10.0.0.0 - 10.0.0.255
    VNET02 - 10.0.1.0/24        10.0.1.0 - 10.0.1.255

2. Azure Site to Site VPN 
3. Azure Express Route 
4. Azure Point to Site VPN


Azure Network Security Group: NSG
============================

- Subnet 
- NIC 


PublicIP:
========

SKU: Basic & Standard

- Static        Always constant 
- Dynamic       IP wil change when the attached resources is restarted/stopped. End of life 30th September 2025.


Azure Keyvault: PAAS
==============
    - Secrets
    - Keys
    - Certificates 


az keyvault secret show --name win-vm-password --vault-name ramakrishna-kv --query value -o tsv

az keyvault secret show --name linux-vm-password --vault-name ramakrishna-kv --query value -o tsv

Azure Resource Locks:
====================

- ReadOnly
- Delete


Microsoft Entra ID (Formarly called Azure Active Directory (AAD)): Cloud based identity and access management. 
=================================================================

Active directory:   Identity and Access management 
================

Windows Server --> ADDS (Active directory domain services) --> Active directory admin center


SSO - Single Sing on   (OKTA)
SSPR - Self service password reset
RBAC 
Security Monitoring
MFA - Multi Factor Authentication 

License:
    - Microsoft Entra ID Free 
    - Microsoft Entra ID P1
    - Microsoft Entra ID P2


App registration (Service Principal):
====================================




az login --service-principal --username 8958afb3-696c-483d-9318-4428b0212ea8 --password sK.8Q~TF1omh6JTmedc6JUDhGlps7~scpGdgEaHw --tenant 459865f1-a8aa-450a-baec-8b47a9e5c904


Managed Identity:
================



Azure App Services: PAAS
==================

Azure VM --> IAAS solution 
Azure App Services --> PAAS solution


1. Web Apps
    App Service plan 

2. Function Apps
    Server less compute. 

    Saturday -> 1000 VMs shutdown (30min)
    Monday -> 1000 VMs start (30min)

3. Logic Apps


WebApp --> .NET application 

Application Insights


www.maruthi-cars.com

        |
        
https://ramakrishna638.azurewebsites.net/


Custom domain


Azure Bastion:
=============

Service Endpoint:
===============


Private Endpoint:
================

- Private endpoint 
- NIC (private ip)
- Private DNS 
- Private link (Azure resource)


Azure Loadbalancers:
===================

1. Azure Loadbalancer
        - OSI Layer 4 
        - types:  Public and Internal loadbalancer
        - BackendPool:
            - VM
            - VMSS
        - HTTP 
        - SKU
            Standard
            Gateway

2. Appplication Gateway
        - OSI Layer 7 
        - Pathbased Routing
        - Multisite hosting 
        - SSL Offloading
        - Session Affinity
        - Backend Pool 
            - VM
            - VMSS
            - App Services
            - IP Address or FQDN 
        - HTTP and HTTPS

amazon.in

3. Traffic Manager:  DNS-based traffic load balancer.

4. Azure frontdoor 
    Application Gateway + Traffic Manager + CDN 


VMSS:
====


Azure Monitor:
=============
Azure Monitor:   Infrastructure monitoring
Application Insights: Application Moniroting


Azure SQL:
=========
- Azure SQL Database Hyperscale PAAS
- Azure SQL                     PAAS
- Azure SQL MI                  PAAS
- Azure SQL VM                  IAAS 

SSMS - SQL Server Management studio 

SQL - 





Loganalytics workspace - KQL 


JSON:
====

ARMTemplates:
============

template.json
parameters.json

Structure:

Schema
ContenetVersion
Parameters
Variables
Resources 
Outputs

Bicep:
=====

main.bicep
main.bicepparam

RG
VNET
Subnet
NSG 
NIC
VM
OSDISK
Storage Account

storage.bicep
RG - ARM 
    storage account 
    VM

RG - ARM 
vnet.bicep
    vnet and subnet

Incremental Mode
Complete mode



Terraform:
=========

ARMTemplates                            Bicep                                           Terraform (IBM)
============                            =====                                           =========
1. IAC                                  1. IAC                                          1. IAC 
2. Azure Native                         2. Azure Native                                 2. Opensource (Azure, AWS, GCP, OCI, onprem etc) 
3. JSON Language                        3. DSL (Domain specific language)               3. HCL (Harshicorp configuration Language)
4. template.json                        4. main.bicep                                   4. main.tf
    parameters.json                         main.bicepparam                                 variables.tf
5. Schema                               5. param                                        5. Buildig blocks:
    contentVersion                          resources                                       providers
    Parameters                              outputs                                         resources
    Variables                                                                               ouputs
    Resources
    Outputs
6. New-AzResourceGroupDeployment `      6. New-AzResourceGroupDeployment `              6. Terraform Lifecycle
    -ResourceGropuName `                    -ResourceGropuName `                            terraform init
    -TemplateFile `                         -TemplateFile `                                 terraform fmt
    -TemplateParameterFile `                -TemplateParameterFile `                        terraform validate
    -Verbose                                -Verbose                                        terraform plan
    -Mode                                                                                   terraform apply 
                                                                                            terraform destroy


AzureDevops:
===========

- Azure Boards
- Azure Repos
- Azure Pipelines
- Azure Testplans
- Azure Artifacts


Azure Boards:
============

Agile 

Backlogs 

Sprint planning 1 - 2 weeks 

    Capacity planning - 24th Nov - 5th Dec

    UserStories - 5 (2) 
        Tasks 

Daily Standup calls - 15min to 30min

Retrospective
    - What went well
    - What didn't went well
    - What can be improved


Sprint planning 2 - 8th to 19th Dec



Epic        -   Amazon.in

Features    - Singup Page 
            - Login Page 
            - Home page 
            - Product category 
            - Cart 
            - PaymentGateway
            - Tracking page 
            - Support 

Userstory   - Singup Page 
            - Login Page 

Tasks       - Singup with google 
            - Singup with apple 
            - Singup with facebook 


Azure Pipelines:
===============

Pre-requisites:

    - Agent pool (VM)  

        Self-Hosted (private VM) 

            1  pwd
            2  mkdir myagent && cd myagent
            3  pwd
            4  wget https://download.agent.dev.azure.com/agent/4.264.2/vsts-agent-linux-x64-4.264.2.tar.gz
            5  ls
            6  tar zxvf vsts-agent-linux-x64-4.264.2.tar.gz
            7  ls
            8  rm vsts-agent-linux-x64-4.264.2.tar.gz
            9  ls
            10  ./config.sh
            11  ls
            12  ./run.sh
            13  sudo ./svc.sh install &&
            14  sudo ./svc.sh install
            15  sudo ./svc.sh start

        Microsoft Hosted (Microsoft will assign a VM) - https://aka.ms/azpipelines-parallelism-request


    - Service Connection (Service Principal)







# Create a resource group
az group create --location centralindia --name java-rg

# Create an app service plan of type Linux
az appservice plan create -g java-rg -n java-service-plan --is-linux

# Create an App Service from the plan with Java SE as the runtime
az webapp create -g java-rg -p java-service-plan -n saanvikitjava --runtime "JAVA|8-jre8"



GitHub Actions: CI CD Platform
==============

AzurePipeline --> GitHub Actions
Jenkins --> GitHub Actions

GitHub Runners:
    - GitHub Hosted Runners 
    - Self-Hosted Runners



