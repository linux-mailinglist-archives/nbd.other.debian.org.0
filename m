Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uISxL7uT6Gl9MgIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 22 Apr 2026 11:24:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1E443E76
	for <lists+nbd@lfdr.de>; Wed, 22 Apr 2026 11:24:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 20581205EC; Wed, 22 Apr 2026 09:24:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 22 09:24:11 2026
Old-Return-Path: <3E5DoaQkbACwaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6604820492
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Apr 2026 09:08:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.642 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vnp8WUZUWS4b for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Apr 2026 09:08:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-oo1-f69.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 83B922049C
	for <nbd@other.debian.org>; Wed, 22 Apr 2026 09:08:38 +0000 (UTC)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6853c2438b9so9625082eaf.3
        for <nbd@other.debian.org>; Wed, 22 Apr 2026 02:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776848915; x=1777453715;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JguPi/7ATNTE9BtiIq8gZF3u2uWzOV/oKtj5SBfscVk=;
        b=IeORL4WTtzghJ3McPiFfZ+mgh3EUtjQ1WuRnPkh+mzxsiCpiahuYh9VVFaSyKLdlL/
         zbzbxiZKkZbx0+uU9STB8ky2TCZS/MEa2xsVphyO9kzaMyoPIYFhdOOqxuCV6OxyrC+D
         /NZagdWv97ocnsMkmXiLF5NyvjTfGqVta/ppFrN92JRlno9Lem8WNuFpb/b2xyuxdViu
         zruCP6ADLCUiukT2ad9BoX8w84svrD1ku/IpqadoM/JONqNnbxw2GpSmO8hEP3igfMc2
         kytsU9Iyq9Z7LL+7dVZr42ftKr6IioEuQZkos3v8zi+FF++3c3oCICRopDoBv/xp5Y6f
         /AOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+N2aSnm9VAwmI98SXbsWYPhJ7T4RYHaIOtlqpcJFjb2dZndo5QinB0+VWst3Lm+ZCcQy0=@other.debian.org
X-Gm-Message-State: AOJu0YxadaSdbQC/n5rdsbctZFKs7iR0Ack3viAdP4/wrtLki9N7JfnQ
	oslD+GIeX7Ytn5YM7PHUJL2X7LtAoVbyKyyp0NY1LGwuj2031tkrbZQ3bxJ+rETn7aJV9ajLbMl
	QPTWqV/qXLC2nz7eUJjvs1S9EItcnAPdXAf8GKrBQeWyz9ehLx9iCzcCE5kI=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:604:b0:689:7cd7:259e with SMTP id
 006d021491bc7-69462f44c08mr12786544eaf.57.1776848915595; Wed, 22 Apr 2026
 02:08:35 -0700 (PDT)
Date: Wed, 22 Apr 2026 02:08:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69e89013.a00a0220.17a17.002a.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Apr 2026)
From: syzbot <syzbot+liste3c870f14b55e93ead74@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fARTBXswm6F.A.4XhD.7OJ6pB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3535
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/69e89013.a00a0220.17a17.002a.GAE@google.com
Resent-Date: Wed, 22 Apr 2026 09:24:11 +0000 (UTC)
X-Spamd-Result: default: False [-0.21 / 15.00];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de,liste3c870f14b55e93ead74];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	REDIRECTOR_URL(0.00)[goo.gl];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,googlegroups.com:email,bendel.debian.org:helo,bendel.debian.org:rdns,goo.gl:url]
X-Rspamd-Queue-Id: 53A1E443E76
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
<1> 3815    Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 724     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 205     Yes   possible deadlock in nbd_queue_rq
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

