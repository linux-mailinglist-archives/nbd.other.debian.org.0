Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIlZOKQewWmTQwQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 23 Mar 2026 12:06:12 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E62F0D12
	for <lists+nbd@lfdr.de>; Mon, 23 Mar 2026 12:06:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 093E420601; Mon, 23 Mar 2026 11:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 23 11:06:11 2026
Old-Return-Path: <3sxrBaQkbAEIw23oeppivettmh.ksskpiywivgsrxirx.gsq@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 40DA6205DD
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Mar 2026 10:49:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.328 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M4-STkP0bOUt for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Mar 2026 10:49:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-oo1-f69.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 37F03205D5
	for <nbd@other.debian.org>; Mon, 23 Mar 2026 10:49:26 +0000 (UTC)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67deade993dso58977eaf.3
        for <nbd@other.debian.org>; Mon, 23 Mar 2026 03:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262963; x=1774867763;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+F/uP0hCrF08RwIunjWB/vAhy2zWhsGOC1vnA6Wtr0=;
        b=r8jdz6jtwyHHA3FHrq8DUc/E//l9Z1egH4m7J0OANedj/0YJlG4rDj4GGlqNXGxWJN
         yE9Nb2Jb+rZjxIQTf+vpwhCXx6aN+mRvZ7taoyD6UF7edLx22RjXrUIuWt7kFVz5rdDj
         ahrKbVTGvHEaQP3btZZEQ2rs9H1ckNWAN8bzA2dlR4u+JJjOTL1UHVTTkYGFq42hFaa9
         X43D169Hu8bB1lVepxn9LRc/h8Pwnxsa+ROmkCexRSqCD6moC8DpL/Nwk08aDLIkMDs6
         qfbaFyDrp2ZyT5tVyxmLACxc8qk67hwCkUsswtkM8z0Bf3p/7blcOvqOhoStMR7of6zS
         4LIg==
X-Forwarded-Encrypted: i=1; AJvYcCUo8L1JzJFDJB9xvsB3bExYaX2X0AkUB3WFA+FexavQKI8jdOSyGYI59EmwOCyBV0GmbR8=@other.debian.org
X-Gm-Message-State: AOJu0YyiuMwv7R64YTBrMfqTxfFWG1J5QOQGhIHnBkCgFYtgDf2CJcAl
	8cA4ng9Lo5ZXhxg4yEdYrYiFBObcZWBf2wriM6yd0uYRg9+Pjumw/3knBZDSNBdIdDsZ6l9A0nJ
	rq9NkW5Gbh4NUHV2KFGZc3m0xJKB3lGFfun2a//Pp1RICbhAMj9JDXn+JQH4=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d0c:b0:67d:e5f5:24fe with SMTP id
 006d021491bc7-67de5f525e2mr3243551eaf.3.1774262963290; Mon, 23 Mar 2026
 03:49:23 -0700 (PDT)
Date: Mon, 23 Mar 2026 03:49:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c11ab3.050a0220.3bf4de.0098.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Mar 2026)
From: syzbot <syzbot+list13600ca525397f269b78@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LgZ1KZ2eTVN.A.t4mN.j6RwpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3523
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/69c11ab3.050a0220.3bf4de.0098.GAE@google.com
Resent-Date: Mon, 23 Mar 2026 11:06:12 +0000 (UTC)
X-Spamd-Result: default: False [-0.31 / 15.00];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de,list13600ca525397f269b78];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,goo.gl:url,googlegroups.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 453E62F0D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 9 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3562    Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 639     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 87      Yes   possible deadlock in nbd_queue_rq
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

