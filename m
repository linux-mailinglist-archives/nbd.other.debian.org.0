Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB34CA7E56
	for <lists+nbd@lfdr.de>; Fri, 05 Dec 2025 15:09:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 21F5E20577; Fri,  5 Dec 2025 14:09:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  5 14:09:11 2025
Old-Return-Path: <3oOMyaQkbAIMz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E5281205B1
	for <lists-other-nbd@bendel.debian.org>; Fri,  5 Dec 2025 13:52:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.31 tagged_above=-10000 required=5.3
	tests=[FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.212, RCVD_IN_MSPIKE_H2=-0.01,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ELK55aAsLZLW for <lists-other-nbd@bendel.debian.org>;
	Fri,  5 Dec 2025 13:52:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-oi1-f200.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EE516205AE
	for <nbd@other.debian.org>; Fri,  5 Dec 2025 13:52:35 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4509d3ce317so1484184b6e.1
        for <nbd@other.debian.org>; Fri, 05 Dec 2025 05:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764942752; x=1765547552;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2NJsbOFgjDMjMXuTTthPeUQ4SXsnG37aVsP6Rf2Hfw=;
        b=VOPC1Krwr30A7+Xj6JIA8DW18ehfln0x1oW9Mq1PfMWj2VBBTgCl+8tk7OX2PgeohN
         VDOeQCECSIsWlEap2mLUv+Se0406vtXbi1TDkDxte2uAVlXKA/i4r7CMbVC2Vt7fx4sg
         TsZkRorB5hZQ/KAnVpFcrPxSRYxoraUy0JsDWhjDl1yGgQQ7TIQoRHeCU97hbQdhH6RX
         BzOQVGU23jzqp5PgUYJI8u1btv+ofSct66Risl+zB0ieHKNtdeFwsSj3A1kbcEyYOoui
         jx7DcY9qmy9RBFj6TbuEy2L4ac4NhsJfiBGgcSD3LadvtiqvMVcWB9UGb8lzzk26G8Fd
         cjvw==
X-Forwarded-Encrypted: i=1; AJvYcCXe6UDo0FvS4U9TYPtTkXdyTQJSxFID1f+t0xb811z0K1hRjiXlGJJ0H9XmX9hDuMoT2Eg=@other.debian.org
X-Gm-Message-State: AOJu0YyJWcgyLZIkFL2p7fwx/0o01eIVI4FuWjlB+KEBgNzOAyU5nx4t
	c6t++C4IQzM41JcUyfE3gF85Jr8qhwdkmCbIQRUVZpYpnYIOAHAnc6YZ9vA/fg/YorlCEmlcsZ+
	9VbzI4RBDxgbdV9VwQRhZyKVSTVKFAP+EQHupXPiNCrF+40r9SA4gleG+GvE=
X-Google-Smtp-Source: AGHT+IHWFKnCnOqu89ScSwCSTHdi2z9hmBNOjlHIHVufF/6YxQ2sdGEhrDokhnEXojx9qkfHff8TrfeUNSK2uLZcRH4nqUL/6+jr
MIME-Version: 1.0
X-Received: by 2002:a05:6808:221a:b0:442:522:41a3 with SMTP id
 5614622812f47-4536e5de194mr5174327b6e.60.1764942752324; Fri, 05 Dec 2025
 05:52:32 -0800 (PST)
Date: Fri, 05 Dec 2025 05:52:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6932e3a0.a70a0220.243dc6.000a.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Dec 2025)
From: syzbot <syzbot+list151df4a5fb9739ee568a@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EiLyxG5PrGE.A.OS6M.HeuMpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3478
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6932e3a0.a70a0220.243dc6.000a.GAE@google.com
Resent-Date: Fri,  5 Dec 2025 14:09:11 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 8 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2556    Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 353     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 67      Yes   possible deadlock in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=3dbc6142c85cc77eaf04

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

