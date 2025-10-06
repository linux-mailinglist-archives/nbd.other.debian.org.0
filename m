Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E0BBED6A
	for <lists+nbd@lfdr.de>; Mon, 06 Oct 2025 19:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1D99E2070D; Mon,  6 Oct 2025 17:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct  6 17:45:11 2025
Old-Return-Path: <3d_zjaAkbAE48EF0q11u7q55yt.w44w1uA8u7s439u39.s42@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E9B19206F2
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Oct 2025 17:29:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.89 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hk9hQhQTbb0r for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Oct 2025 17:29:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f198.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B0F4B206EE
	for <nbd@other.debian.org>; Mon,  6 Oct 2025 17:29:31 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-42f6c3feed8so21348365ab.0
        for <nbd@other.debian.org>; Mon, 06 Oct 2025 10:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759771768; x=1760376568;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYSGI+wm950aF63lFDgqtSx38FxRnb1uTcZG6/4yc3Y=;
        b=sa3+F9cd2YJg9FlxkCFz4Jtc2m9Or2diXhr84ee2OTVUNSyRUGO8RYZEQctfFgur5J
         ZyBVYXOQEaMZD2SWOYXQY2s/SDms53drCI5XrOWLMxKqCekmERrk4Yle1/aPHwn7SNWi
         C7ieWMKC5fBt01WmrquqDpztQals8M8lC8KSRlD8NNUPkMfJuhVsgZGEo1/DpNkK+Jtv
         c0ICt/speljayWAwqEAj4NKLxuqWzNjgHQKRQYm6eCPORx5vQjvpB9JfJLmFmnLl3T8B
         9gwbqgjQlTKCPmJCxI76mY502bL1ADvCaglu4uX9fW+VKhuzKFtJw1g2kpYe7SpWv+Zy
         kL6g==
X-Forwarded-Encrypted: i=1; AJvYcCWKmIq44h9RsT6DlGjvyHRwfRhNae/L6AEGU6y6c9avRl+RYXzmr07OtprKGDFqBqM4yTI=@other.debian.org
X-Gm-Message-State: AOJu0YwqY5aGhKkytJySOFm5Hj0+cbOyegoPh8zrXCvJ3Vu3wsx8pbXq
	rS3X7g1K0W0Wq9weKKoAMJz9nLBQTI4cK9LLIp2vHVYrEnKn2pMac8XJfe3F1+mK1fm1rzPeTIR
	snUOXTvpVEB/FT6QshRZj0/0kxdz6btmSoUzZYFU+ePL4oPiqymgg4/aZ+HE=
X-Google-Smtp-Source: AGHT+IFU19mSImJx6lton1MLSZgMp/idojUMivv0dv20oP6EqORkEcAASG3o4o0SdtLiJarrNuwleMsqT6tgK4XpkuHhHS6TQiiM
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1889:b0:42e:4c23:5363 with SMTP id
 e9e14a558f8ab-42e7adb29a1mr189932465ab.29.1759771767957; Mon, 06 Oct 2025
 10:29:27 -0700 (PDT)
Date: Mon, 06 Oct 2025 10:29:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e3fc77.a70a0220.160221.0006.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Oct 2025)
From: syzbot <syzbot+listddef0da3f5f843882aee@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tbGD3qnKCjB.A.qii.mAA5oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3447
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/68e3fc77.a70a0220.160221.0006.GAE@google.com
Resent-Date: Mon,  6 Oct 2025 17:45:11 +0000 (UTC)

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 0 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 8 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2150    Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 310     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 146     Yes   INFO: task hung in nbd_ioctl (3)
                  https://syzkaller.appspot.com/bug?extid=fe03c50d25c0188f7487
<4> 88      No    INFO: task hung in nbd_disconnect_and_put
                  https://syzkaller.appspot.com/bug?extid=aa56a8f25e07970eef7f
<5> 62      Yes   possible deadlock in nbd_queue_rq
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

