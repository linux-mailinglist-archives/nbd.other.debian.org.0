Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DF497A2AC65
	for <lists+nbd@lfdr.de>; Thu,  6 Feb 2025 16:24:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B96B3207E1; Thu,  6 Feb 2025 15:24:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  6 15:24:11 2025
Old-Return-Path: <boitutile@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 445A420665
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Feb 2025 15:07:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QuKoiNdIH0DI for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Feb 2025 15:07:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 12BDD203CF
	for <nbd@other.debian.org>; Thu,  6 Feb 2025 15:07:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so260550f8f.3
        for <nbd@other.debian.org>; Thu, 06 Feb 2025 07:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738854462; x=1739459262; darn=other.debian.org;
        h=to:date:message-id:subject:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R2XclBiy61cVKL5YsEtNPt/Ng1jNltaD0aYWzOmaL8U=;
        b=AjmVwpl+fWF7L8bPrF1D1DdbXzq1mvIeYO/6InsEGGMRTg7NoFxbS3yjC6I/J04kPD
         hlV4jAzJ16xG8ULjpkl0tw6SxHYsOwxLTgkRsNyZJIABjVoqMpIOpxmEXHL9Wi6BJJm5
         A8lGhMxzaUclB7/OV34PVh2/r1IIaVSs4ER/N+6CZwRpft5YzZOOP5A9Z7xDgJYJfCLm
         g30eSz9X15AY22tNQopN+4+Ukiy+lE2OtNcVSn0A+S8VDDtlD3ADHVADUdUDOIpw0HKU
         mn74awwhR0Yxdieznc2mUDYXQzHcmEc5EXh1+PhPFJ6W8JbS1M+KDN68orD7bjndwJxz
         ry+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854462; x=1739459262;
        h=to:date:message-id:subject:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2XclBiy61cVKL5YsEtNPt/Ng1jNltaD0aYWzOmaL8U=;
        b=KhIxJ0bbPdAd8k/DZoQIsGVlZN5caDWuYB7rWlUFXzIDYa8gY4IUlb1VveyX5AwfzD
         tBsrCOc5Iqqqidtso0zNmsBo44V32/QCbW7z8jz4OqgrcQa629RKW20Bt2d+8zZc9Bw6
         amdxwovXieqLoeCc5R+d4moV4U6Umd2dn3atq7nLP+3ObvMjp0Dsezfzi8iVks+ZJUB6
         xSvYnEBBdQJgNe1OV2IlxRyqGoWdgfkA6SBiTtrbvzZSeE4DzkRLDQ6tBsEfN8FpBG45
         4+T0Hn2k6nF86hy+ngd41w745UCuIuAQQRg1B0wSsKlNLVJARwvxpbmexRVfkTvt8FGE
         bKTg==
X-Gm-Message-State: AOJu0YwfTprLB3JLAQksCfJksvFLJ3GphRWkXmIwNpQGybqhnrzv6aZp
	9uxrDBCwokPKY9IChSfIbClS1rpzK0cSTBrrAM7MRCpL6Nr4y58MY9VpjVhv
X-Gm-Gg: ASbGncvWlgwXdkVzp4YoS4Q4St4VdbOKZxg6a2pYD2c1691RW/zKdJLKQ1b0qjvKXHa
	1fExR2zdfSLVNCazemkhuKj4Kos5W+tPUuR7MygMrodS9+KgEX6bC6GosvFlze4XmSNDzoU9Gor
	JimA44YFMFIz+4CY58q4f351RcwjLTVSmyyKFJ2+I2UHxgpd/8Hacdso1jeh3TSQyCkwaX7dGpk
	ClNgs56zHewUwRUZ9rHnNba/XImvAU+mwOGP9uUIaAWBZdYsq4owFDzd2QCmSaKZc9FOSppT5cZ
	u8Vp6IF++FW17j6hoRbpQQM1c1aExSo9toY0KdM=
X-Google-Smtp-Source: AGHT+IHiJfrykFj3TzNcQpBqyt/li6fjIGtrsVbiHH3+LI8CBWtVnNP3h4aJaszAILQ62MUf3wMsSw==
X-Received: by 2002:adf:e787:0:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38db4967642mr4331066f8f.53.1738854460187;
        Thu, 06 Feb 2025 07:07:40 -0800 (PST)
Received: from smtpclient.apple ([2a01:e0a:503:7b30:117:d651:68da:4075])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm23004115e9.1.2025.02.06.07.07.39
        for <nbd@other.debian.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2025 07:07:39 -0800 (PST)
From: Thomas Pellegatta <boitutile@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_BB301160-52FA-46B8-B689-E40E2B30429C"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Failed to netboot NBD rootfs
Message-Id: <5537C251-DD61-4457-88F2-45EDADE94F85@gmail.com>
Date: Thu, 6 Feb 2025 16:07:28 +0100
To: nbd@other.debian.org
X-Mailer: Apple Mail (2.3774.600.62)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q2hK5Ba5AJJ.A.1vGN.bQNpnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3367
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5537C251-DD61-4457-88F2-45EDADE94F85@gmail.com
Resent-Date: Thu,  6 Feb 2025 15:24:11 +0000 (UTC)


--Apple-Mail=_BB301160-52FA-46B8-B689-E40E2B30429C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello,
I can=E2=80=99t find any solution on the internet so I=E2=80=99m =
reaching you by email.

I=E2=80=99m trying to achieve netboot on one of my devices. To do so I =
made a dedicated image:

truncate -s 10G debian-nbd.img
mkfs.btrfs debian-nbd.img
sudo mount -t btrfs -o loop debian-nbd.img /mnt
rsync -avPAHXxe path/to/existing/debian/rootfs /mnt
sudo umount /mnt

Then I created a NBD conf /etc/nbd-server/conf.d/diskless.conf:

[node]
  exportname =3D /path/to/debian-nbd.img

And I edited /etc/nbd-server/config:

[generic]
  user =3D root
  group =3D root

I restart nbd-server

I provide PXE boot to my device thanks to the following file content:

LABEL Armbian [NBD]
  MENU LABEL Armbian [NBD]
  KERNEL /srv/tftp/2c546b9f5bc2ee5d/Image
  INITRD /srv/tftp/2c546b9f5bc2ee5d/uInitrd
  FDT /srv/tftp/2c546b9f5bc2ee5d/rk3588s-rock-5c.dtb
  APPEND root=3D/dev/nbd0 nbdroot=3D192.168.1.46,10809,node rw ip=3Ddhcp =
rootwait ipv6.disable=3D1

When powering my device, here is the output I get:

[   20.867028] Run /init as init process
Loading, please wait...
[   20.910031] rk-pcie fe190000.pcie: PCIe Link Fail, LTSSM is 0x3, =
hw_retries=3D1
Starting systemd-udevd version 252.31-1~deb12u1
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top =
... Begin: Setting up nbd-client ... Begin: Waiting up to 180 secs for =
any network device to become available ... done.
IP-Config: eth0 hardware address aa:bb:38:6d:f8:fb mtu 1500 DHCP
IP-Config: eth0 complete (dhcp from 192.168.1.254):
 address: 192.168.1.179    broadcast: 192.168.1.255    netmask: =
255.255.255.0  =20
 gateway: 192.168.1.254    dns0     : 192.168.1.254    dns1   : 0.0.0.0  =
      =20
 rootserver: 192.168.1.254 rootpath:=20
 filename  :=20
Negotiation: ..Error: Unknown error returned by server. Server said: =
Export unknown
Exiting.
/scripts/local-top/nbd: 121: /scripts/local-top/nbd: grep: not found
done.
Begin: Running /scripts/local-premount ... done.
Begin: Waiting for root file system ... [   21.925710] rk-pcie =
fe190000.pcie: failed to initialize host
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
^C^CBegin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
[   30.961199] platform mtd_vendor_storage: deferred probe pending
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
[   39.920255] [GTP-ERR][__do_register_ext_module:79] Module =
[goodix-fwu] timeout
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
[   51.867783] vdd_gpu_s0: disabling
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
done.
Gave up waiting for root file system device.  Common problems:
 - Boot args (cat /proc/cmdline)
   - Check rootdelay=3D (did the system wait long enough?)
 - Missing modules (cat /proc/modules; ls /dev)
ALERT!  /dev/nbd0 does not exist.  Dropping to a shell!
(initramfs)=20


Moreover here is the output of the master server journalctl -F:

Feb 06 16:01:30 rpi nbd_server[82115]: Spawned a child process
Feb 06 16:01:30 rpi nbd_server[82123]: Negotiation failed: Connection =
reset by peer
Feb 06 16:01:30 rpi nbd_server[82123]: Exiting.
Feb 06 16:01:30 rpi nbd_server[82115]: Child exited with 1

Is it something you already encountered before?

BR
Thomas


--Apple-Mail=_BB301160-52FA-46B8-B689-E40E2B30429C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hello,<div>I =
can=E2=80=99t find any solution on the internet so I=E2=80=99m reaching =
you by email.</div><div><br></div><div>I=E2=80=99m trying to achieve =
netboot on one of my devices. To do so I made a dedicated =
image:</div><div><span><br></span></div><div><font =
face=3D"Menlo"><span>truncate</span><span> -s 10G =
debian-nbd.img</span></font><div></div></div><div><span><font =
face=3D"Menlo">mkfs.btrfs debian-nbd.img</font></span></div><div><font =
face=3D"Menlo"><span>sudo mount -t btrfs -o loop d</span>ebian-nbd.img =
/mnt</font></div><div><font face=3D"Menlo">rsync -avPAHXxe =
path/to/existing/debian/rootfs /mnt</font></div><div><font =
face=3D"Menlo">sudo umount /mnt</font></div><div><br></div><span>Then I =
created a NBD conf&nbsp;<font =
face=3D"Menlo">/etc/nbd-server/conf.d/diskless.conf:</font></span><div></d=
iv><div><span><font face=3D"Menlo"><br></font></span></div><div><font =
face=3D"Menlo">[node]</font></div><div><font face=3D"Menlo">&nbsp; =
exportname =3D /path/to/debian-nbd.img</font></div><div><font =
face=3D"Menlo"><br></font></div><div>And I edited<font face=3D"Menlo"> =
/etc/nbd-server/config</font>:</div><div><font =
face=3D"Menlo"><br></font></div><div><font =
face=3D"Menlo">[generic]</font></div><div><font face=3D"Menlo">&nbsp; =
user =3D root</font></div><div><font face=3D"Menlo">&nbsp; group =3D =
root</font></div><div><font face=3D"Menlo"><br></font></div><div>I =
restart<font face=3D"Menlo">&nbsp;nbd-server</font></div><div><font =
face=3D"Menlo"><br></font></div><div>I provide PXE boot to my device =
thanks to the following file content:</div><div><font =
face=3D"Menlo"><br></font></div><div><div><font face=3D"Menlo">LABEL =
Armbian [NBD]</font></div><div><font face=3D"Menlo">&nbsp; MENU LABEL =
Armbian [NBD]</font></div><div><font face=3D"Menlo">&nbsp; KERNEL =
/srv/tftp/2c546b9f5bc2ee5d/Image</font></div><div><font =
face=3D"Menlo">&nbsp; INITRD =
/srv/tftp/2c546b9f5bc2ee5d/uInitrd</font></div><div><font =
face=3D"Menlo">&nbsp; FDT =
/srv/tftp/2c546b9f5bc2ee5d/rk3588s-rock-5c.dtb</font></div><div><font =
face=3D"Menlo">&nbsp; APPEND root=3D/dev/nbd0 =
nbdroot=3D192.168.1.46,10809,node rw ip=3Ddhcp rootwait =
ipv6.disable=3D1</font></div></div><div><font =
face=3D"Menlo"><br></font></div><div>When powering my device, here is =
the output I get:</div><div><font =
face=3D"Menlo"><br></font></div><div><div><font face=3D"Menlo">[ &nbsp; =
20.867028] Run /init as init process</font></div><div><font =
face=3D"Menlo">Loading, please wait...</font></div><div><font =
face=3D"Menlo">[ &nbsp; 20.910031] rk-pcie fe190000.pcie: PCIe Link =
Fail, LTSSM is 0x3, hw_retries=3D1</font></div><div><font =
face=3D"Menlo">Starting systemd-udevd version =
252.31-1~deb12u1</font></div><div><font face=3D"Menlo">Begin: Loading =
essential drivers ... done.</font></div><div><font face=3D"Menlo">Begin: =
Running /scripts/init-premount ... done.</font></div><div><font =
face=3D"Menlo">Begin: Mounting root file system ... Begin: Running =
/scripts/local-top ... Begin: Setting up nbd-client ... Begin: Waiting =
up to 180 secs for any network device to become available ... =
done.</font></div><div><font face=3D"Menlo">IP-Config: eth0 hardware =
address aa:bb:38:6d:f8:fb mtu 1500 DHCP</font></div><div><font =
face=3D"Menlo">IP-Config: eth0 complete (dhcp from =
192.168.1.254):</font></div><div><font face=3D"Menlo">&nbsp;address: =
192.168.1.179 &nbsp; &nbsp;broadcast: 192.168.1.255 &nbsp; =
&nbsp;netmask: 255.255.255.0 &nbsp;&nbsp;</font></div><div><font =
face=3D"Menlo">&nbsp;gateway: 192.168.1.254 &nbsp; &nbsp;dns0 &nbsp; =
&nbsp; : 192.168.1.254 &nbsp; &nbsp;dns1 &nbsp; : 0.0.0.0 &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;</font></div><div><font =
face=3D"Menlo">&nbsp;rootserver: 192.168.1.254 =
rootpath:&nbsp;</font></div><div><font face=3D"Menlo">&nbsp;filename =
&nbsp;:&nbsp;</font></div><div><font face=3D"Menlo">Negotiation: =
..Error: Unknown error returned by server. Server said: Export =
unknown</font></div><div><font =
face=3D"Menlo">Exiting.</font></div><div><font =
face=3D"Menlo">/scripts/local-top/nbd: 121: /scripts/local-top/nbd: =
grep: not found</font></div><div><font =
face=3D"Menlo">done.</font></div><div><font face=3D"Menlo">Begin: =
Running /scripts/local-premount ... done.</font></div><div><font =
face=3D"Menlo">Begin: Waiting for root file system ... [ &nbsp; =
21.925710] rk-pcie fe190000.pcie: failed to initialize =
host</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">^C^CBegin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font face=3D"Menlo">[ =
&nbsp; 30.961199] platform mtd_vendor_storage: deferred probe =
pending</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font face=3D"Menlo">[ =
&nbsp; 39.920255] [GTP-ERR][__do_register_ext_module:79] Module =
[goodix-fwu] timeout</font></div><div><font face=3D"Menlo">Begin: =
Running /scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font face=3D"Menlo">[ =
&nbsp; 51.867783] vdd_gpu_s0: disabling</font></div><div><font =
face=3D"Menlo">Begin: Running /scripts/local-block ... =
done.</font></div><div><font face=3D"Menlo">Begin: Running =
/scripts/local-block ... done.</font></div><div><font =
face=3D"Menlo">done.</font></div><div><font face=3D"Menlo">Gave up =
waiting for root file system device. &nbsp;Common =
problems:</font></div><div><font face=3D"Menlo">&nbsp;- Boot args (cat =
/proc/cmdline)</font></div><div><font face=3D"Menlo">&nbsp; &nbsp;- =
Check rootdelay=3D (did the system wait long =
enough?)</font></div><div><font face=3D"Menlo">&nbsp;- Missing modules =
(cat /proc/modules; ls /dev)</font></div><div><font face=3D"Menlo">ALERT! =
&nbsp;/dev/nbd0 does not exist. &nbsp;Dropping to a =
shell!</font></div><div><font =
face=3D"Menlo">(initramfs)&nbsp;</font></div></div><div><font =
face=3D"Menlo"><br></font></div><div><font =
face=3D"Menlo"><br></font></div><div>Moreover here is the output of the =
master server <font face=3D"Menlo">journalctl -F:</font></div><div><font =
face=3D"Menlo"><br></font></div><div><div><font face=3D"Menlo">Feb 06 =
16:01:30 rpi nbd_server[82115]: Spawned a child =
process</font></div><div><font face=3D"Menlo">Feb 06 16:01:30 rpi =
nbd_server[82123]: Negotiation failed: Connection reset by =
peer</font></div><div><font face=3D"Menlo">Feb 06 16:01:30 rpi =
nbd_server[82123]: Exiting.</font></div><div><font face=3D"Menlo">Feb 06 =
16:01:30 rpi nbd_server[82115]: Child exited with =
1</font></div></div><div><font face=3D"Menlo"><br></font></div><div>Is =
it something you already encountered =
before?</div><div><br></div><div>BR</div><div>Thomas</div><div><font =
face=3D"Menlo"><br></font></div></body></html>=

--Apple-Mail=_BB301160-52FA-46B8-B689-E40E2B30429C--

