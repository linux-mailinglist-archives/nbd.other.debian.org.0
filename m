Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QS3LAaS5Q2p5fwoAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 30 Jun 2026 14:42:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E96E44D9
	for <lists+nbd@lfdr.de>; Tue, 30 Jun 2026 14:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sina.com header.s=201208 header.b="Q5errFI/";
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=none) header.from=sina.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0DBAB20AF2; Tue, 30 Jun 2026 12:42:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 30 12:42:10 2026
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2425820A9E
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 Jun 2026 12:25:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.897 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vFTP_oSj5MDz for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 Jun 2026 12:25:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sina. - helo: .r3-22.sinamail.sina. - helo-domain: .sina.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1937320AAA
	for <nbd@other.debian.org>; Tue, 30 Jun 2026 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1782822307;
	bh=QQyh2nC/4NGFvtsANqCnlaM6CSzqIRdJ8tB/XxgHJdE=;
	h=From:Subject:Date:Message-ID;
	b=Q5errFI/UWREtlbjE4Mg8iB6EGAs8A+6caEWY+y3RoSrIz/oMFUPi+gkzP6drppBR
	 9MYmRuo29hVRALmYAx6hwyjeIyHpXMivfrruYIi1c9bdhFOtn8USXvkKEi/hlu6lw9
	 jTtrI8FCInVU3RyLn5d0ibV9UC7amQnn+VbglTQQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.33) with ESMTP
	id 6A43B5970000594B; Tue, 30 Jun 2026 20:24:57 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 9825056685345
X-SMAIL-UIID: B3B0E47636B64BB6BC3652F5649B4CBE-20260630-202457-1
From: Hillf Danton <hdanton@sina.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: don't warn when reclassifying a busy socket lock
Date: Tue, 30 Jun 2026 20:24:43 +0800
Message-ID: <20260630122445.314-1-hdanton@sina.com>
In-Reply-To: <CANn89iL-RTVME9qcUSVZW6qBEkVh8suw2pcLMCh0WM1fTEz6Jw@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-1_BmFWaqwK.A.KV2D.im7QqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3576
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260630122445.314-1-hdanton@sina.com
Resent-Date: Tue, 30 Jun 2026 12:42:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edumazet@google.com,m:kartikey406@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[hdanton@sina.com,bounce-nbd=lists@other.debian.org];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_FROM(0.00)[sina.com];
	R_SPF_NA(0.00)[no SPF record];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,bounce-nbd=lists@other.debian.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,other.debian.org,syzkaller.appspotmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	DKIM_TRACE(0.00)[sina.com:+];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:dkim,sina.com:email,sina.com:mid,sina.com:from_mime,bendel.debian.org:rdns,bendel.debian.org:helo,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 306E96E44D9

On Tue, 30 Jun 2026 00:19:45 -0700 Eric Dumazet wrote:
> On Sun, Jun 28, 2026 at 10:29 PM Hillf Danton <hdanton@sina.com> wrote:
> > For archive purpose, syzbot report [1] where udp was not invovled defies
> > what is fixed in d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep
> > circular dependency") -- "Since the UDP socket and the NBD TCP/TLS socket
> > are different, this is a false positive."
> >
> >
> > [1] Subject: [syzbot] [net?] possible deadlock in inet_shutdown (3)
> > https://lore.kernel.org/lkml/69c37e6a.a70a0220.234938.0045.GAE@google.com/
> 
> Why don't you send a patch if you think one is needed?
>
Good question. It is a long standing tough issue, frankly more difficult than
I could cure it in one shoot at the cost of a couple weeks, particularly given
the rule of thumb -- delivering half baked croissants, HBC, as few as possible.

