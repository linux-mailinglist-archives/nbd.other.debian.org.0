Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 73746C318F3
	for <lists+nbd@lfdr.de>; Tue, 04 Nov 2025 15:37:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 52E3920994; Tue,  4 Nov 2025 14:37:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  4 14:37:43 2025
Old-Return-Path: <36wsKaQkbAHoqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D53F8208E6
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Nov 2025 14:21:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.81 tagged_above=-10000 required=5.3
	tests=[FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_PSBL=2.7,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id i5csY3tvMe3X for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Nov 2025 14:21:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-io1-f69.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 219A420956
	for <nbd@other.debian.org>; Tue,  4 Nov 2025 14:21:35 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-927b19c5023so461257739f.1
        for <nbd@other.debian.org>; Tue, 04 Nov 2025 06:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266092; x=1762870892;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7L/jSGya7egt/NiedCx/1BfP1PKnwqFiSMxG2dzvm6E=;
        b=pILqJlXrVnGPzU4uChQtNpPUi75EuKA9DmBb2huQeX9jaTdcIJyHF+HGtCtVjKYUto
         Hc+i2bENcRXpXou/OFeaV1zxvVjEs/yUJO+8vRucLibKQH7q4PUK0UdCsKJBSRZAeEZs
         8PbQx7Mp1chgvx8KOmNq8Gz5ccFGP47gzITC/wr1cp2L+MpS9AeMcELRb2EqxHcSIHhY
         biSnB5JG4yLGIXm9Tsvlq15szgZQQ62giaWA0JEU+ESscZdMDWzB2U8s4RWbnDqJqiI8
         Y/SZ9MmMzRBVyx82imW6t4TP2E+XFFfy8PjV6EERfcXX1sfJq6W4c0jn1Qd6JU+qhOQk
         ZUYA==
X-Forwarded-Encrypted: i=1; AJvYcCXdPuMiii5hEsk3o+Ti6Fza6UvZ/MnCmbm68fbqj8cOA0JXO1SjzFIsTeDcM+8e+zu12G8=@other.debian.org
X-Gm-Message-State: AOJu0YzaFvlC0Zq5gUqwFakThXlMHsAtlgcJ+e6AH/S45MZRzqYzbDNg
	k43JEixCkAHucP3g29TQQzqy659hojLzIakxnWzUhPVdvRGt25Wc62ciZlgF4Pns8xxFYXldsJU
	5EfxC3K+3f1IZh5H07EHkqiV3M0rznA3qMXOYvKH/ORGY8xh7n+vZRuIiFkM=
X-Google-Smtp-Source: AGHT+IHmghhbRbHc2151lEMdR+Fkctnu2OMAFAv+53FJy/pwcW/nqwYE+rSNRwYm8lpm9Ln89ZBat27dAoQpv/kgtCP6eb3W0aQ4
MIME-Version: 1.0
X-Received: by 2002:a05:6602:718b:b0:945:cbd9:55cc with SMTP id
 ca18e2360f4ac-948229840a8mr2134810839f.15.1762266091838; Tue, 04 Nov 2025
 06:21:31 -0800 (PST)
Date: Tue, 04 Nov 2025 06:21:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690a0beb.050a0220.98a6.00af.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Nov 2025)
From: syzbot <syzbot+listc0bf6fe607a7f411a734@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HAcGLkCjkjL.A.NSw.3-gCpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3465
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/690a0beb.050a0220.98a6.00af.GAE@google.com
Resent-Date: Tue,  4 Nov 2025 14:37:43 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 8 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2373    Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 339     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 64      Yes   possible deadlock in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=3dbc6142c85cc77eaf04
<4> 4       Yes   KASAN: slab-use-after-free Write in recv_work (3)
                  https://syzkaller.appspot.com/bug?extid=56fbf4c7ddf65e95c7cc

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

