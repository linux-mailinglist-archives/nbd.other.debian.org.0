Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38BB42015
	for <lists+nbd@lfdr.de>; Wed,  3 Sep 2025 14:54:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 19AB220573; Wed,  3 Sep 2025 12:54:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  3 12:54:14 2025
Old-Return-Path: <3Uza4aAkbAOwgmnYOZZSfOddWR.UccUZSigSfQcbhSbh.Qca@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4B5B92057A
	for <lists-other-nbd@bendel.debian.org>; Wed,  3 Sep 2025 12:36:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.89 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id b9pFZIORYVdJ for <lists-other-nbd@bendel.debian.org>;
	Wed,  3 Sep 2025 12:36:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-io1-f71.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9DB3B20544
	for <nbd@other.debian.org>; Wed,  3 Sep 2025 12:36:39 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-886e91263aeso1338602239f.3
        for <nbd@other.debian.org>; Wed, 03 Sep 2025 05:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756902996; x=1757507796;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LHOUvTxUHRDZHTuy2WgSxf7xJT4vtu2i2hgQBjuX7w=;
        b=XJKkOffaywtyB5WG/5FQQ98EV1wZqNSkzey0NziIBgpglBuVwuUQL0SQczQ4AeEhBz
         GVkSf7OZnQjD3ouFQd9MPeJ3r+LSTSFzkYHvH3intSd6IU1iP031/XWxafEKSuyxjyaI
         T5hXRNqWeMTQGgVxK5R28/RgJWpg9YmJOXj9K1ptGXTjHnDbkJSXj16iuiEhiz2A+9/6
         lqsikqdRESpuyXXSVzViF6qY0cglFMYZxxPpj1aSixAr6W2lYSt/PwBQdqW5xIxzn7yz
         a45L6cwCmKq8mXMtB5k+172OywnP4F1iU6aYpVwiF0RGfWI/cJ3ZYIjDJKHTR3zQ6e6M
         u8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW9+lW6gV/myDamVQwhYbrAvjt1/ND6YLX1Rp3rGYSaZ2amYf7wpa/KM+pGW74vAfLvTWE=@other.debian.org
X-Gm-Message-State: AOJu0YzwhZw5XD63RPgBtjmwMQfGtHQpngFhVOP474pHki8JJuz3wowx
	cHTeiXjrCOtkUBGiYmr6K+o+5WcmD5zLQWY+nNtYveL4CwUvosvQabMJrwgxyRNss/hZjESamui
	KeFQedtHO2P6PeCC0RbCcd5IOv9LW6qX1aAlFLhmYXCJFLhvUURt4ZP7dwH8=
X-Google-Smtp-Source: AGHT+IETUswS2yDFuaaHHg2PyJKvgAiFrqCIYR4tRHFKt9SSy6k3VMVIe6nukUo/0neTzFmx7S3M8oMr51X9urYuFi1S6OfiVxkd
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1488:b0:3f1:a5b9:4a32 with SMTP id
 e9e14a558f8ab-3f3ffda5bacmr225600425ab.1.1756902995790; Wed, 03 Sep 2025
 05:36:35 -0700 (PDT)
Date: Wed, 03 Sep 2025 05:36:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68b83653.050a0220.3db4df.01ef.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Sep 2025)
From: syzbot <syzbot+liste8f48e3526c73d4bcab4@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xTG-PKNw_MJ.A.QseG.2pDuoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3430
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/68b83653.050a0220.3db4df.01ef.GAE@google.com
Resent-Date: Wed,  3 Sep 2025 12:54:14 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 0 new issues were detected and 0 were fixed.
In total, 8 issues are still open and 8 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 861     Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 304     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 143     Yes   INFO: task hung in nbd_ioctl (3)
                  https://syzkaller.appspot.com/bug?extid=fe03c50d25c0188f7487
<4> 55      No    INFO: task hung in nbd_disconnect_and_put
                  https://syzkaller.appspot.com/bug?extid=aa56a8f25e07970eef7f
<5> 6       No    possible deadlock in nbd_queue_rq
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

