Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B110550AFD1
	for <lists+nbd@lfdr.de>; Fri, 22 Apr 2022 08:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4A00420450; Fri, 22 Apr 2022 06:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 22 06:00:11 2022
Old-Return-Path: <matthew.ruffell@canonical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E6DDD20435
	for <lists-other-nbd@bendel.debian.org>; Fri, 22 Apr 2022 05:42:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.945 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.575, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cvJbSIsFvp3a for <lists-other-nbd@bendel.debian.org>;
	Fri, 22 Apr 2022 05:42:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .canonical. - helo: .smtp-relay-internal-0.canonical. - helo-domain: .canonical.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B2D052042E
	for <nbd@other.debian.org>; Fri, 22 Apr 2022 05:42:40 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E42DE3F1B0
	for <nbd@other.debian.org>; Fri, 22 Apr 2022 05:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1650606156;
	bh=hWerQpQZlUf6tJ3oEQBKDh+uBBIZTIztZC7wzThBamE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Q7+1a/8gM/eL4iLPaWUCxpzsnrFL5jSxImAp8SvHSOWxlkIyXrnWi3sjXGm8Umnz/
	 rNOLYJN0UTzW+a2jWF847yDPi95fX1wE3bJQ11TBzt6Of40WH3HhLMVRnMcrXMqfXT
	 mP3zkan3kBSZXFWyKaOrqSVDrUowmeJXHuEs1PlpdUa8mAHD7EI+7E/i4pWzLq/uKe
	 NWTc2xDKlO9+OLTDIKuAi79JB1V3l4Kk3otNnVWdDNV63E8fm+NmbGxC7TVjdwir0u
	 016gBmCfOj5rEX+5svRH7fuCZNJz1zKyvjNtOqstWrn+d3KwUJTj6lEvW//KhMjwcT
	 1waKHsMtnRXjA==
Received: by mail-pl1-f199.google.com with SMTP id i16-20020a170902cf1000b001540b6a09e3so3872531plg.0
        for <nbd@other.debian.org>; Thu, 21 Apr 2022 22:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWerQpQZlUf6tJ3oEQBKDh+uBBIZTIztZC7wzThBamE=;
        b=h606atDzb5i/9KRy59SST2c8cguSwus5YuMvAX8z9D0StqLrKLtGhIvhr2Boedri8A
         DpmwzXsbuc2P9FFw4jpyydO8nQRyN8AX0zMd/bXIHQwI6oWH/1lPdXKeEogyinF7OM9k
         B3NApgZgI9bBVGXRhYDktwDCaxCD0EIA0cfnK9/Vdi4xWxKGxEWSG5+aHm18E+6ER6ZK
         fbIL2XeHcQR4xpWfSi4l+V9BPmTj0VpYAYFW+MVwEOc5AplKFechDIeuT/W15QoNT2Az
         9UC8VBmFm0kb+y+zs+a2ST5oQcNGZoypcSAWnRGJheDH8DAn4DHe2nx9p/weq6QHx8y7
         3hJw==
X-Gm-Message-State: AOAM531NBbw27tJKmB5FrQu0qVA3Wol+2Nd7F0qgvJXViB3jx1UI9duo
	uv8mnCDFZBzJuRy1FFdhLHP+aHdXgaBnejjWaafuYNlLCS5Cr3q7nQIabhH7Uz5i+kFSMH/4ma1
	wC/joPZCMO0WnUHU38huMpw4JBgibbMs=
X-Received: by 2002:a63:2ad0:0:b0:3aa:c8d5:c7b9 with SMTP id q199-20020a632ad0000000b003aac8d5c7b9mr521905pgq.306.1650606154926;
        Thu, 21 Apr 2022 22:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRsYMLjMdP/oCRdsW7JcxBBna5VFVNb2T+2REufL2x1MY+dEqZKv+dVqN/g4A2C83rrU4MUA==
X-Received: by 2002:a63:2ad0:0:b0:3aa:c8d5:c7b9 with SMTP id q199-20020a632ad0000000b003aac8d5c7b9mr521895pgq.306.1650606154661;
        Thu, 21 Apr 2022 22:42:34 -0700 (PDT)
Received: from desktop.. (125-239-17-100-fibre.sparkbb.co.nz. [125.239.17.100])
        by smtp.gmail.com with ESMTPSA id m13-20020a62a20d000000b004fe0ce6d7a1sm1018633pff.193.2022.04.21.22.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 22:42:34 -0700 (PDT)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: josef@toxicpanda.com
Cc: axboe@kernel.dk,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PROBLEM] nbd requests become stuck when devices watched by inotify emit udev uevent changes
Date: Fri, 22 Apr 2022 17:42:24 +1200
Message-Id: <20220422054224.19527-1-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <M6YX3hU-dCB.A.VWE.rRkYiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2044
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220422054224.19527-1-matthew.ruffell@canonical.com
Resent-Date: Fri, 22 Apr 2022 06:00:11 +0000 (UTC)

Dear maintainers of the nbd subsystem,

A user has come across an issue which causes the nbd module to hang after a
disconnect where a write has been made to a qemu qcow image file, with qemu-nbd
being the server.

The issue is easily reproducible with the following:

Ubuntu 20.04, 22.04 or Fedora 36
Linux 5.18-rc2 or earlier (have tested 5.18-rc2, 5.15, 5.4, 4.15)
QEMU 6.2 or earlier

Instructions to reproduce:
==========================

$ sudo apt install qemu-nbd

$ cat << EOF >> reproducer.sh
#!/bin/bash

sudo modprobe nbd

while :
do
        qemu-img create -f qcow2 foo.img 500M
        sudo qemu-nbd --disconnect /dev/nbd15 || true
        sudo qemu-nbd --connect=/dev/nbd15 --cache=writeback --format=qcow2 foo.img
        sudo mkfs.ext4 -L root -O "^64bit" -E nodiscard /dev/nbd15
        sudo qemu-nbd --disconnect /dev/nbd15
done
EOF

$ chmod +x reproducer.sh
$ ./reproducer.sh

On Ubuntu, the terminal will pause within a minute or two, and dmesg will report
a lot of I/O errors, followed by hung task timeouts. On Fedora, it takes a 
little longer, but it will break in the same way within 10 minutes.

An example kernel log is below:

https://paste.ubuntu.com/p/5ZjC5b8MR7/

Debugging done:
===============

Looking at syslog, it seems systemd-udevd gets stuck, and enters D state.

systemd-udevd[419]: nbd15: Worker [2004] processing SEQNUM=5661 is taking a long time

$ ps aux
...
419    1194 root     D     0.1 systemd-udevd   -

I rebooted, and disabled systemd-udevd and its sockets, with:

$ sudo systemctl stop systemd-udevd.service
$ sudo systemctl stop systemd-udevd-control.socket
$ sudo systemctl stop systemd-udevd-kernel.socket

When running the reproducer again, everything works fine, and nbd subsystem does
not hang.

Looking at udev rules, I looked at the differences between those in Ubuntu 18.04
where the issue does not occur, and 20.04, where it does, and came across:

/usr/lib/udev/rules.d/60-block.rules

In 18.04:
# watch metadata changes, caused by tools closing the device node which was opened for writing
ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"

In 20.04:
# watch metadata changes, caused by tools closing the device node which was opened for writing
ACTION!="remove", SUBSYSTEM=="block", \
  KERNEL=="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*", \
  OPTIONS+="watch"
  
The difference is the OPTIONS+="watch" being added to nbd* any event not remove.

When I deleted nbd* and retried the reproducer again, everything works smoothly.

Looking at the manpage for udev:

> watch
>   Watch the device node with inotify; when the node is closed after being 
>   opened for writing, a change uevent is synthesized.
>
> nowatch
>   Disable the watching of a device node with inotify.

It appears that there is some sort of problem where systemd-udevd uses inotify
to watch for updates to the device metadata, and it blocks a subsequent
disconnect request, causing it to fail with:

block nbd15: Send disconnect failed -32

After which we start seeing stuck requests:

block nbd15: Possible stuck request 000000007fcf62ba: control (read@523915264,24576B). Runtime 30 seconds

All userspace calls to the nbd module hang, and the system has to be rebooted.

Workaround:
===========

We can workaround the issue by adding a higher priority udev rule to not watch
nbd* devices.

$ cat << EOF >> /etc/udev/rules.d/97-nbd-device.rules
# Disable inotify watching of change events for NBD devices
ACTION=="add|change", KERNEL=="nbd*", OPTIONS:="nowatch"
EOF

$ sudo udevadm control --reload-rules
$ sudo udevadm trigger

Help on debugging the problem:
==============================

I need some help debugging the problem, as I am not quite sure how to trace
the interactions between inotify and nbd.

I am happy to help debug the issue, or try any patches that gather debugging
data or any potential fixes.

Thanks,
Matthew

