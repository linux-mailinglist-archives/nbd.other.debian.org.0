Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B89FC4C0
	for <lists+nbd@lfdr.de>; Wed, 25 Dec 2024 11:24:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CEF52070A; Wed, 25 Dec 2024 10:24:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Dec 25 10:24:10 2024
Old-Return-Path: <3V9lrZwkbAPou01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 32BC12069D
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Dec 2024 10:07:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.644 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KezYXjbO_j9R for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Dec 2024 10:07:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.25
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2C1FB206FE
	for <nbd@other.debian.org>; Wed, 25 Dec 2024 10:07:23 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ab68717b73so54319605ab.2
        for <nbd@other.debian.org>; Wed, 25 Dec 2024 02:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735121239; x=1735726039;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNivbUa6+4Ughys9abAGbWAgtVIkfDguQE7jRYMVtB4=;
        b=pkxV15ut9e51PRhV7r9J3QOv6GoMsCL5Ru+pYZm0dhIY6PAdcaoLs+4bhavK5qg6Ex
         EIH5sKcBan26TUj04w94q95aZUdzxuNv2PiRoje0M05WwuKJHGldh/Py3nTPL4Ubylez
         Z/PcVV+eikty2MxgruyOtZHf9nuJaUzpyVKaSNuvplYMR5NR/EhizFYi1QutfSNcQguS
         dijkCpmGCbnR76Ij7yHV1SH6aW4NZJUIwu2l47XmSUhNH+3EfcFvjhdqy7wAJ1eqp1cz
         ZNG4a0JCawvhLbKJ3woMOU2QeofcdGgQ9u5INxYBSAzM5K/7Mn4PvwZD4rEuprbGYG+K
         lYyg==
X-Forwarded-Encrypted: i=1; AJvYcCWUWfctOBU9lasD0Eo77QLLhJiNmcvZ4ZX2F9x72EfoO6bJtRaLeBl4vMz/W0NQa36ua0E=@other.debian.org
X-Gm-Message-State: AOJu0YzSHmBS+9oSm5xcyoKcRyY5VtWw1d4bzAV8kdP32plSZrU8bHXL
	g22blijyxixauO0T94D01KIqkRKrXRvezoRnJjPw6odfMtX5HE/Pulr61+8glSX8pgXcVSFAqoH
	/qxmsV31Yf6O+i3KqSqn89m9sGJYbH1KV/GNX4x98o6xcR2Hdntr4uCk=
X-Google-Smtp-Source: AGHT+IFMtVOZJVNwUJ7/iLAMok5mGb7P+w3OjPP2mflGxI1ocxud/M+iwc4qeTi9EiG+/Fxs83zn5K4Ws8T85Qo3DF7Ad4rhQlL3
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a63:b0:3a8:1195:f1f9 with SMTP id
 e9e14a558f8ab-3c2d2564124mr185082775ab.6.1735121239760; Wed, 25 Dec 2024
 02:07:19 -0800 (PST)
Date: Wed, 25 Dec 2024 02:07:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676bd957.050a0220.2f3838.02e2.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Dec 2024)
From: syzbot <syzbot+lista56c9771895bcef0bc37@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bnBx5zO720G.A.L8tF.K19anB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3204
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/676bd957.050a0220.2f3838.02e2.GAE@google.com
Resent-Date: Wed, 25 Dec 2024 10:24:10 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 6 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 133     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<2> 129     Yes   INFO: task hung in nbd_ioctl (3)
                  https://syzkaller.appspot.com/bug?extid=fe03c50d25c0188f7487
<3> 25      No    possible deadlock in __nbd_set_size
                  https://syzkaller.appspot.com/bug?extid=143deed0891e0c211d8f
<4> 12      No    possible deadlock in __synchronize_srcu (2)
                  https://syzkaller.appspot.com/bug?extid=c89fbbd2838560d51069
<5> 5       No    possible deadlock in nbd_set_size
                  https://syzkaller.appspot.com/bug?extid=966c3b607cb094ce7299

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

