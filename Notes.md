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