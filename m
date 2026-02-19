Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD06BqbUlmmVowIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 19 Feb 2026 10:15:18 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8715D3FF
	for <lists+nbd@lfdr.de>; Thu, 19 Feb 2026 10:15:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 22B3020539; Thu, 19 Feb 2026 09:15:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 19 09:15:17 2026
Old-Return-Path: <37NCWaQkbAD0rxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 45D7E204FD
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Feb 2026 08:59:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.111 tagged_above=-10000 required=5.3
	tests=[FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id b1lgtT9E0NGh for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Feb 2026 08:59:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-oo1-f71.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1E8B6204CE
	for <nbd@other.debian.org>; Thu, 19 Feb 2026 08:59:27 +0000 (UTC)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-678f3fef828so11182652eaf.1
        for <nbd@other.debian.org>; Thu, 19 Feb 2026 00:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491564; x=1772096364;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5nC+b72pVA44Uc6CcxtsvLZb+c2BvwoMTpPD1V9VdNs=;
        b=XAEZRO1Qy8Wi1y4v3CTnvKPL018wEM9p+KqGs6gqWgE4uKuk6QfzKiuECo2HlwNrn8
         neSPFpuGWNUQM+VdqX1+u7svjRDjLTTw8jzYX2d4rZU7fYRbIHTO8qvTFlcp/DcNmvaa
         gMJaJ4jjSVHJR+38W8ZsyFEBh9OKKMrxOfL15GmzolfNx1lU3LFzd+FeJ29FjZBsD1cI
         3Y/jCkH/pj2BQfqpNXcJg4PeRaUCiMv7a/kBc+WiMxw4RX853oCOX56uJtytXC2tSvsS
         Ivxq06IH3akkhScaUOKNWkZUi4c7Wa+mep1BWH55Ad+mg6p1vajmCh7cImL0hWg24YuP
         OwQw==
X-Forwarded-Encrypted: i=1; AJvYcCXXgb1Uv1ByJbwve9ba6JJrNZQrJRpKZaLwkahJ1nsPoIMtYkG/69aQhoM9+n1AjzI8Wko=@other.debian.org
X-Gm-Message-State: AOJu0YxEnAak7vFshoW3kvl4wMcoM/nulNkpRqEhKT8qNMwaCowXUrTr
	mgn6jaT+/E3gEdsD25yW8Rimv7aNodzN+uXuMvXLCgDSm7Q2brsiBK5FS8rA1aJqnNOPpRFJjCV
	Ld0VtfB74kjvmRSOVhuor26ghWpSTUQfBHf0v+U0P7VizVkfQM8tAOFxPSvM=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4a0d:b0:66e:58f3:b505 with SMTP id
 006d021491bc7-679a71b93bdmr1828802eaf.12.1771491564022; Thu, 19 Feb 2026
 00:59:24 -0800 (PST)
Date: Thu, 19 Feb 2026 00:59:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6996d0ec.050a0220.21cd75.0107.GAE@google.com>
Subject: [syzbot] Monthly nbd report (Feb 2026)
From: syzbot <syzbot+list11bd3f2823c04b2285b6@syzkaller.appspotmail.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XTlU_dXyfxC.A.u5iH.kStlpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3498
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6996d0ec.050a0220.21cd75.0107.GAE@google.com
Resent-Date: Thu, 19 Feb 2026 09:15:17 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de,list11bd3f2823c04b2285b6];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,goo.gl:url,bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: 58F8715D3FF
X-Rspamd-Action: no action

Hello nbd maintainers/developers,

This is a 31-day syzbot report for the nbd subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nbd

During the period, 1 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 9 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3344    Yes   possible deadlock in pcpu_alloc_noprof (2)
                  https://syzkaller.appspot.com/bug?extid=91771b3fb86ec2dd7227
<2> 560     Yes   INFO: task hung in nbd_queue_rq
                  https://syzkaller.appspot.com/bug?extid=30c16035531e3248dcbc
<3> 74      Yes   possible deadlock in nbd_queue_rq
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

