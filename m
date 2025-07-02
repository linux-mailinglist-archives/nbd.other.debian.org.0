Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 25028AF59F6
	for <lists+nbd@lfdr.de>; Wed,  2 Jul 2025 15:48:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 757A920571; Wed,  2 Jul 2025 13:48:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  2 13:48:15 2025
Old-Return-Path: <37jRlaAkbADclrsdTeeXkTiibW.ZhhZeXnlXkVhgmXgm.Vhf@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C24F620566
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jul 2025 13:32:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mVrb3uIXTY8h for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jul 2025 13:32:37 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f200.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BFD32204CC
	for <nbd@other.debian.org>; Wed,  2 Jul 2025 13:32:34 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso47511665ab.2
        for <nbd@other.debian.org>; Wed, 02 Jul 2025 06:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463151; x=1752067951;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BubBoaagMLzEv8l+ERjtuMPNq+Ob+FgzeUx4GVvJZL4=;
        b=BG84T6NNJ4h+aV32aHZREhXETPm0ZHqA55/PyCN3Qen/usFoejYf2bPocZ/22R0IYE
         Pnmr23XVtk+GbIQiE/G4YyNsT6yJqNfIaAKn18U9MJDFT73TohEvX5jRbrrGZ6kWYVEh
         D+WsZWI1VmcKaenNoRBuvzMpsBrEgII5GyOZzoXMR9tYR3IvnAzPxWOVE0GSOIFHYP1F
         GRLTKNDt2h+KjrfaSxkSfel3Z3PyI5Cblz/UWUxHMtPDb9yc2MX3FGPKi3MFoNAWZNC7
         avLcjItemnj/Q4VMyIcKKDSueaqwe+LNjOE1qNTOm8/Fwek7oJmyox2sOmYX0clOyQSv
         igRA==
X-Forwarded-Encrypted: i=1; AJvYcCX7G8yxqNnRVgqL0wEVKM/7QT9sJyWgRtkmx94F9Xm88E3jzq2t/Isk5IhhN5htZQ0qDLU=@other.debian.org
X-Gm-Message-State: AOJu0YxqCHPeefIJYwgE9J7LuxZqIzmjQXuw+Z1jCCGyCTgONqF8GsMV
	GslG6dSmRyKy/kLTqYVZTCH0qL1yErUGukKGw1tfrEOZgBAwdcbyYQe6sl7TREEsfKTUOIvvWqW
	kkR52T+wI3m6GMDwG2B7e9zb0inW2BJwzSawaygyDiA16wUczQ/Otunjw1hc=
X-Google-Smtp-Source: AGHT+IHrimW8AKa/QhbwsVFAuzkmWEJwu5jAAhd5cDMyuxLiN0due4eoa8Liqe22LG8AEgSEqp6N1ctGEi1FXIX6eNNGIE53a9al
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214f:b0:3dc:8b29:3092 with SMTP id
 e9e14a558f8ab-3e054935199mr29220845ab.5.1751463150832; Wed, 02 Jul 2025
 06:32:30 -0700 (PDT)
Date: Wed, 02 Jul 2025 06:32:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686534ee.a70a0220.3b7e22.245a.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Jul 2025)
From: syzbot <syzbot+list09715b34c25b498d986f@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BYb4yGGA3LM.A.OT7K.fiTZoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3402
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/686534ee.a70a0220.3b7e22.245a.GAE@google.com
Resent-Date: Wed,  2 Jul 2025 13:48:15 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 1 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 7 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 288     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<2> 141     Yes   INFO: task hung in nbd_ioctl (3)
                  https://syzkaller.appspot.com/bug?extid=fe03c50d25c0188f7487
<3> 12      No    possible deadlock in nbd_open
                  https://syzkaller.appspot.com/bug?extid=ea702c2366971b7fc6e4
<4> 7       Yes   INFO: task can't die in nbd_ioctl
                  https://syzkaller.appspot.com/bug?extid=69a90a5e8f6b59086b2a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

