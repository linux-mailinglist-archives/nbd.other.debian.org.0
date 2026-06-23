Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aQaaKyvSOWqjxwcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 02:24:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE46B2F7B
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 02:24:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sina.com header.s=201208 header.b=JxLZMFg0;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=none) header.from=sina.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B05482049F; Tue, 23 Jun 2026 00:24:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 23 00:24:10 2026
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38C35207D5
	for <lists-other-nbd@bendel.debian.org>; Tue, 23 Jun 2026 00:07:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id acsaahaxShLU for <lists-other-nbd@bendel.debian.org>;
	Tue, 23 Jun 2026 00:07:44 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sina. - helo: .smtp153-162.sina. - helo-domain: .sina.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F281D207D4
	for <nbd@other.debian.org>; Tue, 23 Jun 2026 00:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1782173264;
	bh=TGbKe0rLiVFtfF8x61Slen8x7rOyc4kXlQ0/hTsWQGU=;
	h=From:Subject:Date:Message-ID;
	b=JxLZMFg0qg2d3dFQe36Ozaqn2Z0LvLbB1pDD3s41yJ1hDGRLECH5EBVNAFxLOBmOY
	 /TpaUw6xONx3HXtr4jyKGHU753AyCAkQ1UJkG7aYk9GT+oXnKbOyeUds1Jd0U4Ug1W
	 QQZ/asjkOTC87qOGgba18llZi3AeVjQVB1SjHKsc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.31) with ESMTP
	id 6A39CE43000021F7; Tue, 23 Jun 2026 08:07:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 3099096816379
X-SMAIL-UIID: 7D25E323B6B64CEC92756238E0BB1098-20260623-080733-1
From: Hillf Danton <hdanton@sina.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: don't warn when reclassifying a busy socket lock
Date: Tue, 23 Jun 2026 08:07:10 +0800
Message-ID: <20260623000723.135-1-hdanton@sina.com>
In-Reply-To: <CANn89iJBomCNpwzOiYHmmPf0i3KQGaqoiKh6VFeM6NHOQaCn3Q@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ox1SeHnWPED.A.3CGL.qIdOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3557
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260623000723.135-1-hdanton@sina.com
Resent-Date: Tue, 23 Jun 2026 00:24:10 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edumazet@google.com,m:kartikey406@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hdanton@sina.com,bounce-nbd=lists@other.debian.org];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,other.debian.org,syzkaller.appspotmail.com];
	DKIM_TRACE(0.00)[sina.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:dkim,sina.com:email,sina.com:mid,sina.com:from_mime,bendel.debian.org:rdns,bendel.debian.org:helo,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6EE46B2F7B

On Mon, 22 Jun 2026 01:18:10 -0700 Eric Dumazet wrote:
>On Sun, Jun 21, 2026 at 6:43 PM Hillf Danton <hdanton@sina.com> wrote:
>> On Mon, 22 Jun 2026 05:22:55 +0530 Deepanshu Kartikey wrote:
>> > nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lock is
>> > held at the point of reclassification. That assertion was copied from
>> > nvme-tcp, where the socket is created internally by the kernel
>> > (sock_create_kern()) and is never visible to user space, so the lock
>> > is guaranteed to be free.
>> >
>> > NBD is different: the socket is looked up from a user-supplied fd in
>> > nbd_get_socket(), and user space retains that fd. A concurrent syscall
>> > on the same socket (or softirq processing taking bh_lock_sock() on a
>> > connected TCP socket) can legitimately hold the lock at the instant
>> > NBD reclassifies it. sock_allow_reclassification() then returns false
>> > and the WARN_ON_ONCE() fires, which turns into a crash under
>> > panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
>> > against socket activity on the same fd, as reported by syzbot.
>> >
>> Given the syzbot report, if you are right (I suspect) then Eric delivered
>> another half-baked croissant, and feel free to cut it off instead to make
>> room for correct fix.
>
> Nobody (including you) caught this.difference between nbd and other
> sock_allow_reclassification() callers.
> 
Nope, actually it raises the question -- does the deadlock still remain
after your fix without the lock key you added applied?

> What was the "correct fix" you envisioned exactly?
>
Frankly I had no evidence against your fix a couple days back, but now I
see your lock key approach fails to take off. And the correct fix is to
erase the incorrect locking order ffa1e7ada456 tries to catch, more
difficult than you thought so far.

