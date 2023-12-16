# BlackHat Linux Notes According to Samuel Mundia Gacheche (@Skoding)
## This are my notes as noted from reading multiple resources on Hacking.

### Analyzing and managing networks

> *Internet Protocol (IP)*  
> *Domain Name System (DNS) Queries*

1. ***ifconfig*** - use it to query your
active network connections
Information include: type of network being used. This information enables one to connect and manipulate LAN **Local Area Network** settings.
2. **Globally unique address**  
 **HW Addr**   
 **Network Interface Card (NIC)**   
 **Media Access Control**
3. **broadcast address** - address used to send out information to all IPs on the subnet
4. **network mask (netmask)** - used to determine what part of the IP address is connected to the local network
5. **loopback address (localhost - lo)** - special software address that connects you to your own system.

>If you have an external USB, you can use the ***iwconfig*** command to gather
crucial information for wireless hacking such as the adapter’s IP address, its
MAC address, what mode it’s in, and more. The information you can glean
from this command is particularly important when you’re using wireless
hacking tools like ***aircrack-ng***.

**Wireless Standards**
1. *802.11 IEEE*  
**Mode Managed** - exists **monitor mode or promiscous mode** used for cracking passwords.

Being able to change IP address and other network information can aid in instances like spoofing where you need it to appear as if attack appearing from a trusted device

**Changing IP address**
> ifconfig eth0 192.185.123.116  
> ifconfig [type ] [IP address] netmask [netmask address] broadcast [broadcast address]

To change MAC address - is globally unique **HW address**
> ifconfig eth0 down  
> ifconfig eth0 hw ether 00:11:22:33:44:55  
> ifconfig up

**(DHCP) Dynamic Host Configuration Protocol**
* Runs in every linux system
* Great for Forensic analysts to track hackers after an attack because
* Runs in the background

**Request IP from DHCP**
> dhclient eth0

**dig** - to examine the Domain Name System (DNS). *ns* for **nameserver**. *ms* for **mail exchange server**
> dig www.domain.org [Options ns/ms]

### Compression and Archaving

makes data smaller thereby requiring less storage capacity and making data easier to transmit.  
Can be *lossy* or *lossless*
**Lossy** compression is effective in reducing size of files but integrity is lost

This type of compression works
great for graphics, video, and audio files, where a small difference in the
file is hardly noticeable—.mp3, .mp4, and .jpg are all lossy compression algo-
rithms.

**Lossless** compression retains  integrity which is crucial for hacking but is not efficient

* when archiving :***tar*** stands for tape archive
c - create
v - verbose (optional)
f - write the following files
* We can display those files from the tarball, without extracting them, by
using the **tar** command with the *-t* content list switch
* To extract use **-xvf**

> tar cvf archive_name.tar file_or_directory_to_archive

This original compressing adds some bytes in the file resulting in a larger file. This becomes insignificant for larger files.

Linux has several commands capable of creating compressed files.
* **gzip** which uses extension .tar.gz or .tgz
* **bzip2** uses .tar.bz2
* **compress** .tar.z

In general, compress is the fastest, but the resultant files are larger; bzip2
is the slowest, but the resultant files are the smallest; and gzip falls some-
where in between.

> gzip *
> will archive everything in that directory

***The dd command makes
a bit-by-bit copy of a file, a filesystem, or even an entire hard drive***

* Even deleted files are copied

> dd if=inputfile of=outputfile  
>dd if=/dev/sdb of=/root/flashcopy

**dd** is your physical “copy” command;
**if** designates your input file, with /dev/*sdb* representing your flash drive in
the /dev directory; **of** designates your output file; and /root/flashcopy is the
name of the file you want to copy the physical copy to.
Other options exists including **noerror** and **bs** for block size and can be adjusted to speed up process.

>dd if=/dev/media of=/root/flashcopy bs=4096 conv:noerror

### Filesystem and storage device management

Explores how linux represents storage devices e.g. hard drives , flash drives ...

the directory known as */dev*, which you’ve probably
already noticed in the **directory structure**: *dev* is short for *device*, and every
device in Linux is represented by its own file within the /dev directory.

__12<sup>th</sup> Nov 2023__  

The six port states recognized by **Nmap**

__open__

    An application is actively accepting TCP connections, UDP datagrams or SCTP associations on this port. Finding these is often the primary goal of port scanning. Security-minded people know that each open port is an avenue for attack. Attackers and pen-testers want to exploit the open ports, while administrators try to close or protect them with firewalls without thwarting legitimate users. Open ports are also interesting for non-security scans because they show services available for use on the network. 
__closed__

    A closed port is accessible (it receives and responds to Nmap probe packets), but there is no application listening on it. They can be helpful in showing that a host is up on an IP address (host discovery, or ping scanning), and as part of OS detection. Because closed ports are reachable, it may be worth scanning later in case some open up. Administrators may want to consider blocking such ports with a firewall. Then they would appear in the filtered state, discussed next. 
__filtered__

    Nmap cannot determine whether the port is open because packet filtering prevents its probes from reaching the port. The filtering could be from a dedicated firewall device, router rules, or host-based firewall software. These ports frustrate attackers because they provide so little information. Sometimes they respond with ICMP error messages such as type 3 code 13 (destination unreachable: communication administratively prohibited), but filters that simply drop probes without responding are far more common. This forces Nmap to retry several times just in case the probe was dropped due to network congestion rather than filtering. This slows down the scan dramatically.
__unfiltered__

    The unfiltered state means that a port is accessible, but Nmap is unable to determine whether it is open or closed. Only the ACK scan, which is used to map firewall rulesets, classifies ports into this state. Scanning unfiltered ports with other scan types such as Window scan, SYN scan, or FIN scan, may help resolve whether the port is open. 
__open|filtered__

    Nmap places ports in this state when it is unable to determine whether a port is open or filtered. This occurs for scan types in which open ports give no response. The lack of response could also mean that a packet filter dropped the probe or any response it elicited. So Nmap does not know for sure whether the port is open or being filtered. The UDP, IP protocol, FIN, NULL, and Xmas scans classify ports this way.
__closed|filtered__

    This state is used when Nmap is unable to determine whether a port is closed or filtered. It is only used for the IP ID idle scan.

__13<sup>th</sup> Nov 2023__

# Hacking APIs
## Pen Testing  
API stands for Application Programming Interface. It's essentially a way for software applications to communicate with each other.  

__BOLA__ - (Brocken Object Level Authorization) is the result of application logic
that fails to control what an authorized user is able to access.  

## Threat Modeling an API Test
**Threat modeling** is the process used to map out the threats to an API provider.  
**A threat actor** is the adversary or attacker of the API  

    To address these distinctions, there are three basic pen-
    etration testing approaches: black box, gray box, and white box

__statement of work (SOW)__  
__open-source intelligence (OSINT)__

The testing effort will involve conducting reconnais-
sance using open-source intelligence (OSINT) to learn as much about the
target organization as possible.

    Once you’ve conducted OSINT,
    you should have compiled a list of target IP addresses, URLs, and API end-
    points that you can present to the client for review. The client should look
    at your target list and then authorize testing.

__Black box__

    testing models the threat of an opportunistic attacker—
    someone who may have stumbled across the target organization or its API.
    In a truly black box API engagement, the client would not disclose any
    information about their attack surface to the tester.

__Gray box__

    A gray box test is a more informed engagement that seeks to reallocate
    time spent on reconnaissance and instead invest it in active testing. When
    performing a gray box test, you’ll mimic a better-informed attacker. You will
    be provided information such as which targets are in and out of scope as
    well as access to API documentation and perhaps a basic user account. You
    might also be allowed to bypass certain network perimeter security controls

**Bug bounty** programs often fall somewhere on the spectrum between
black box and gray box testing.

__White box__

    In a white box approach, the client discloses as much information as
    possible about the inner workings of their environment. In addition to
    the information provided for gray box testing, this might include access to
    application source code, design information, the software development kit
    (SDK) used to develop the application, and more

A __WAF__ is a common defense mechanism for web applications and APIs.

## Mobile Application Testing  
You can test these APIs through
manual code review, automated source code analysis, and dynamic analysis.  
__Manual code review__ involves accessing the mobile application’s source code
and searching for potential vulnerabilities.  

__Automated source code analysis__
is similar, except it uses automated tools to assist in the search for vulner-
abilities and interesting artifacts.  
__Dynamic analysis__ is the testing of
the application while it is running. Dynamic analysis includes intercepting
the mobile app’s client API requests and the server API responses and then
attempting to find weaknesses that can be exploited

**__Rate limiting__** is a restriction on the number of requests an API consumer
can make within a given time frame  
__DoS__ testing consists of attacks that are intended to disrupt services and make the
systems and applications unavailable to users.

# NMAP and SCRIPTING (16th Dec 23)

## Introduction

**nmap** is used to probe a system to see whether it is connected to the network and finds out what ports are open.  
From the open ports discovered, one can summarise what services are running on the target system.

**scripting** is used mainly for automation of commands. Scripting involves writing commands in a systematic manner as you would like the executed

A script starts with a ***shebang***.  Like this - ***#!***
> #! /bin/bash
> #this is a comment  
> echo "Used to output"  
> read response  #for storing variables  
> echo "Now the variable echoed $response"

__Simple scan__  

    nmap < type of scan> < target IP> < optionally, target port>

    nmap -sT 192.128.181.1 #simplest and most reliable for TCP scan

    nmap-sT 192.128.181.1 -p 3306 #to scan specific port


### A script to scan for port

__Port scanner__  

    #! /bin/bash/
    #This script is designed to find hosts with MySQL installed
    nmap -sT 192.168.181.0/24 -p 3306 >/dev/null -oG MySQLscan
    cat MySQLscan | grep open > MySQLscan2
    cat MySQLscan2