Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260C979063
	for <lists+nbd@lfdr.de>; Sat, 14 Sep 2024 13:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 11BCC205F1; Sat, 14 Sep 2024 11:15:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep 14 11:15:14 2024
Old-Return-Path: <3UWzlZgkbAPww23oeppivettmh.ksskpiywivgsrxirx.gsq@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 16CB520620
	for <lists-other-nbd@bendel.debian.org>; Sat, 14 Sep 2024 10:58:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.055 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_SBL_A=0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id roKXhck0AaH7 for <lists-other-nbd@bendel.debian.org>;
	Sat, 14 Sep 2024 10:58:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-io1-f71.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B76BB2061B
	for <nbd@other.debian.org>; Sat, 14 Sep 2024 10:58:29 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-82aa4678394so784401839f.3
        for <nbd@other.debian.org>; Sat, 14 Sep 2024 03:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726311506; x=1726916306;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSXhuj3zISCMZB3nnxahyL41R/wox4A+ugF2KROurmQ=;
        b=bfO34lJeuyaI985W0Q/CE1+Su1v/gEE8do50sCodJOpGRLiRLBlx6jnZ2Amki2vXaW
         hwUfJSA2/KPrClmPxYAyEaY/9ASbk+h2P7hivm7M7z2OMTXDfNSHYkfd4uOwD0CLtiRo
         mfeT1Cr2tngmEKuvd8owDQqI66NJiMkFfA+Ig+pvRAha+SWHruQv1UObucg3cLoHoNp/
         VADt0jbXmY+Ph4EN9PJuKJlLn/bWgM+Ii6c5z+vL0dQg34uB+gESh0GCVcxJN/48sQfy
         7xrutyDNk7eG6PINI0b3ScB2fUnffmGQtKhXi2cxZ3/XiTUvbSDjLflzSQHrNw/6AMO8
         jcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUdBPDhGI3IaLlIN3PrS/bu/KW1tWXxSJjyXE20mFluAvS4/mBUS0m+6wzCAZ70tIrCjY=@other.debian.org
X-Gm-Message-State: AOJu0YxzBeGKeLnT5OiBA8ir06jXE/Zc9lF6y2C+FbrPxohmUTVIiKBc
	y03ITcG4rTnAu/kPDiMQ9fkrPYUMm2Gld4U4fokUl3I29nEl3jUfuOg7EAfa2VvVXciNF4Ysvbw
	inLPHKs//ItH9x1umjI5zx8QYF8lwa1wohT86jeQ+MRotNV5EhLptSU8=
X-Google-Smtp-Source: AGHT+IEbp4K5Yuh/JujyoRFTiZfkIFNS7LT8IRlV7c50hWWYcE5sW6Kz1S9OHTVBkx3CynhKyyD9L0xgwQU1PGG6lWtwo0a3T57g
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:48e:b0:3a0:52f9:9170 with SMTP id
 e9e14a558f8ab-3a0848e5d4emr79133095ab.1.1726311505762; Sat, 14 Sep 2024
 03:58:25 -0700 (PDT)
Date: Sat, 14 Sep 2024 03:58:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66e56c51.050a0220.3a9b1.002f.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Sep 2024)
From: syzbot <syzbot+list5448e58c688bab5fb496@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FhmOLyV16HD.A.NpfE.CBX5mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3147
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/66e56c51.050a0220.3a9b1.002f.GAE@google.com
Resent-Date: Sat, 14 Sep 2024 11:15:14 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 0 new issues were detected and 0 were fixed.
In total, 3 issues are still open and 6 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 126     Yes   INFO: task hung in nbd_ioctl (3)
                  https://syzkaller.appspot.com/bug?extid=fe03c50d25c0188f7487
<2> 42      No    INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 7       Yes   INFO: task can't die in nbd_ioctl
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

