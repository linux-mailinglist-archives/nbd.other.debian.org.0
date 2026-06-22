Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PFqDOpSYOGoTeQcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 04:06:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B516AC027
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 04:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sina.com header.s=201208 header.b=BAj1S9M9;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=none) header.from=sina.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 566E4206EA; Mon, 22 Jun 2026 02:06:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 02:06:11 2026
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
	by bendel.debian.org (Postfix) with ESMTP id 0346C20448
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2026 01:49:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.897 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5KyGR-MMEAQi for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2026 01:49:11 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sina. - helo: .r3-25.sinamail.sina. - helo-domain: .sina.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 321 seconds by postgrey-1.36 at bendel; Mon, 22 Jun 2026 01:49:10 UTC
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D6DBE2042D
	for <nbd@other.debian.org>; Mon, 22 Jun 2026 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1782092951;
	bh=GTi82fa48ZAdHtNIVE+MeEaCXBGvzEeerzWekigHzoE=;
	h=From:Subject:Date:Message-ID;
	b=BAj1S9M97OAE9hPOuGP6Vx1r1osuyGXo1IjbNAgR1xqWMfdatMBWJ22yZlB6BBAsV
	 elBKqLaWeJNziXGd7lPLlPH6Rzf9Omv9zWgk32VTH8qZxRRcBtYfGP9MCDYOilPM8j
	 z+VoQsyvgox2PqRmruy700f2/hcB3QUwoaM/nLFk=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.31) with ESMTP
	id 6A3893490000179A; Mon, 22 Jun 2026 09:43:39 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 5437756816665
X-SMAIL-UIID: B2E31ED7DF9D4DB2B4EE62DA31D18A37-20260622-094339-1
From: Hillf Danton <hdanton@sina.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: edumazet@google.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: don't warn when reclassifying a busy socket lock
Date: Mon, 22 Jun 2026 09:43:26 +0800
Message-ID: <20260622014328.115-1-hdanton@sina.com>
In-Reply-To: <20260621235255.66015-1-kartikey406@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yd0C16qus5L.A.SxxH.TiJOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3553
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260622014328.115-1-hdanton@sina.com
Resent-Date: Mon, 22 Jun 2026 02:06:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS(0.00)[m:kartikey406@gmail.com,m:edumazet@google.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hdanton@sina.com,bounce-nbd=lists@other.debian.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sina.com:dkim,sina.com:mid,sina.com:from_mime,syzkaller.appspot.com:url,other.debian.org:from_smtp,bendel.debian.org:rdns,bendel.debian.org:helo];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,bounce-nbd=lists@other.debian.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[sina.com:+];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3B516AC027

On Mon, 22 Jun 2026 05:22:55 +0530 Deepanshu Kartikey wrote:
> nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lock is
> held at the point of reclassification. That assertion was copied from
> nvme-tcp, where the socket is created internally by the kernel
> (sock_create_kern()) and is never visible to user space, so the lock
> is guaranteed to be free.
> 
> NBD is different: the socket is looked up from a user-supplied fd in
> nbd_get_socket(), and user space retains that fd. A concurrent syscall
> on the same socket (or softirq processing taking bh_lock_sock() on a
> connected TCP socket) can legitimately hold the lock at the instant
> NBD reclassifies it. sock_allow_reclassification() then returns false
> and the WARN_ON_ONCE() fires, which turns into a crash under
> panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
> against socket activity on the same fd, as reported by syzbot.
> 
Given the syzbot report, if you are right (I suspect) then Eric delivered
another half-baked croissant, and feel free to cut it off instead to make
room for correct fix.

> Hitting a held lock here is expected for an externally owned socket and
> is not a kernel bug, so skip reclassification silently instead of
> warning. Reclassification is a lockdep-only annotation, so skipping it
> in the rare racing case is harmless.
> 
> Reported-by: syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6b85d1e39a5b8ed9a954
> Fixes: d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular dependency")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 3a585a0c882a..8f10762e90ef 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1246,7 +1246,7 @@ static void nbd_reclassify_socket(struct socket *sock)
>  {
>  	struct sock *sk = sock->sk;
>  
> -	if (WARN_ON_ONCE(!sock_allow_reclassification(sk)))
> +	if (!sock_allow_reclassification(sk))
>  		return;
>  
>  	switch (sk->sk_family) {
> -- 
> 2.43.0

