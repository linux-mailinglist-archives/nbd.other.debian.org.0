Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ery4MfvzOGoekgcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 10:36:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE46ADC81
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 10:36:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="Wc5/w8fk";
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6436220801; Mon, 22 Jun 2026 08:36:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 08:36:11 2026
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AF3A9206E8
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2026 08:18:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TESWQ3xzxTYA for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2026 08:18:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x82b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2BAA9207A6
	for <nbd@other.debian.org>; Mon, 22 Jun 2026 08:18:26 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5176ca6bab1so48525521cf.0
        for <nbd@other.debian.org>; Mon, 22 Jun 2026 01:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782116304; cv=none;
        d=google.com; s=arc-20240605;
        b=EFvM+U0TpSaCuvFAXeT3xd5dKXH4a6ce7nMRLbuIz9M/c/i1Q+IrPGSFzXcW+GOsro
         uKTgQBJrygx2RX+QF4p9QgJG4ZIZJRPWTfOJLgJC5FPbUAQzb9pPm5HWGHYbt/dPIlgj
         SAiw7G+uv94hHkQHRbToomHsmG7XLvUNQPykSWQnKFzLKwqcygUma+2//mGW4wZcVh6c
         IauWGeplDm21Yth4SkQkYyxodx0KqvM377wFkHXUponsJNf5zYjjh/zfWJ//2rURugqW
         JtDZrwy/E1YgZtcB/pajSFF+uz90vfC1i2Vl16Ppwc5biAGmU0aL0+bi7gU/3nIkDtTe
         dFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ysat58UPHNPIc5Z2ZJx5eLQX3NEqVZ8kJWnwpPQ9v0U=;
        fh=RpcysLFK93ZK5b1LgZKPSy+6TbzwC5aVlJpg43BPfUE=;
        b=cKwFYcJMd6l69aBtW/Nz7zTfk4vUlru0ZGdSKcN2fBkOnlG4QHmj5UzNQnYsbUP61V
         biDicfZ0dtdFXrVjmB0qJUsZ3dN1V5U3JJGtD6Kn98/GDzaaMu6DYWf1gZSd5Ol+PgBJ
         XhhRqoDoTe8w8ELXVUZriu27SvlVh+kt3kDJ+DfkjEizT9ZHzS9SH6KsCbk4nKqkbsbo
         sUHbyBgWtKdibbi2NrL1gpY53/rGDsRmoEvRmaryJj2GW3rIgoPAzrPqeRkoAr9Qftwa
         Ql2aZa7+jol9nNHillfKoshJabbIhkLp/uh/gi8KyD46i7S0rsHxsP10jyV3CHLfCBZs
         IeEA==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782116304; x=1782721104; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ysat58UPHNPIc5Z2ZJx5eLQX3NEqVZ8kJWnwpPQ9v0U=;
        b=Wc5/w8fkSLfQ5m9B3B/THD6IYWliC3n5yLgB8jewIs2r+gAaic69JfXFlZuHBdv8nj
         m+PC7uE718l3cNmMTAwxfQTs3MaXQ8tPFo+2MYtph3YO/cHsdfzFl3or3iYjyJL3athq
         j59C4zljadbGJFE9+QEsHWTjI+b6FxWTlZv3yK6AekVRx4lqtmwyZy8jpWPUsvs8YJew
         WNJFrU0YSUE3QT7/L/eNp/elVC3Tzva29jjnESn9RvsPHzA/bIH/qc4nfWR166StJcwG
         SgmvoA5rMvgGQPn/Q6ne4vFn+hys5IQArwOxR5PS6JJuk3LbHv6bFBKOymsmkRLEFn5A
         8WqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116304; x=1782721104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ysat58UPHNPIc5Z2ZJx5eLQX3NEqVZ8kJWnwpPQ9v0U=;
        b=rY2GhYdBVblZZfnH8GWWX1Ki+fxvcs1JHkL3seOweJyBLfKzPVCiHf6uHocez5Ml0B
         iUlFB9MiIe0Zyp9LJQOZK2jqvx+13mPuQh12FbdkqSNXR2Ft515bf5Cv5dPWbS2oVYAd
         fjOTnGNORag14kGq/ylDTUt2ypPAUsQKfBfmKumxTJc+so/OJDPjL/URjDvOqRrARWOT
         e0WKtRYLL5svj2Mk77zTicfigX4UjGGphfkdTRJ1pr1m0ChAuRXPetff+VASI69ZjhIV
         a/YNKpFmgxhVDOvF3xes6utEcETV3edGw5zIak4Va7BR4dII12L/uXJiU27RWv/cGxKb
         kpvg==
X-Forwarded-Encrypted: i=1; AFNElJ95T4tf8E8HCc/Zvmb3Rf8zVoOJsw+m34IykVD9io4il3PCV9A++ep3aQd+3yevtATyzf8=@other.debian.org
X-Gm-Message-State: AOJu0YxS2W0/lP8T31H0ACBbhukCPJtNuI2pvHTsHaopYH7Ymo8pmnPa
	9G0FMJAxFyhO3NStzWeFIQonmQfmkIN0T3osAk60VwBxRD/H2NEM7fU0sCWYyZIxgrP5yIp+CoC
	YA7W9wF+1FahMpXsnq+ClCWcfecwbnobnpBvCVYnxfpa3RYWohSyeD/RDM2c=
X-Gm-Gg: AfdE7clXSP997ZnV0i0DaTZZI9UhDJFaKka6t3SmZC8kClCo4vd2jsstRYVGXivefXg
	+rVOXdvdMLuG1Zp3z7sHkeU3hdJlhphCba1bJbeOKIq41IxFwddKZAs/EvkBqIu6Zct0JYXm1Ai
	godCCgF4/2+lgS66sULFlzCguSyoTf9IJkMYC/lZLMcKTZ2DAfrQUbnvTBfxFkysMFBCLCYMqdA
	0aLM68asN2FgoDeMbFANcNS/EQDNOUQARNPfbC7BfMbpAfurzxFhQCxkMeRbw70naCKCmVWZtzb
	goc0pFkcaX1jzc4Q4nCanzxibKay2vXbn8cP8AtgkzLySAbD3j3wxx3wNaExCHB5AFW0NsAxyeg
	Qw0BlvsdS
X-Received: by 2002:a05:622a:481a:b0:50f:c403:7ffb with SMTP id
 d75a77b69052e-519e67b8339mr168709421cf.18.1782116303091; Mon, 22 Jun 2026
 01:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260621235255.66015-1-kartikey406@gmail.com> <20260622014328.115-1-hdanton@sina.com>
In-Reply-To: <20260622014328.115-1-hdanton@sina.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 22 Jun 2026 01:18:10 -0700
X-Gm-Features: AVVi8Cf-1QZ27ykP333c-2nGDluMcSVlm8OvGXnxHRUILa5f0PO5YI80trF5YqA
Message-ID: <CANn89iJBomCNpwzOiYHmmPf0i3KQGaqoiKh6VFeM6NHOQaCn3Q@mail.gmail.com>
Subject: Re: [PATCH] nbd: don't warn when reclassifying a busy socket lock
To: Hillf Danton <hdanton@sina.com>
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-kernel@vger.kernel.org, 
	syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <W2FyWtx-r_E.A.Jkx.7PPOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3554
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iJBomCNpwzOiYHmmPf0i3KQGaqoiKh6VFeM6NHOQaCn3Q@mail.gmail.com
Resent-Date: Mon, 22 Jun 2026 08:36:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS(0.00)[m:hdanton@sina.com,m:kartikey406@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FREEMAIL_TO(0.00)[sina.com];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,other.debian.org,syzkaller.appspotmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:email,mail.gmail.com:mid,bendel.debian.org:rdns,bendel.debian.org:helo,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CCE46ADC81

On Sun, Jun 21, 2026 at 6:43=E2=80=AFPM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Mon, 22 Jun 2026 05:22:55 +0530 Deepanshu Kartikey wrote:
> > nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lock is
> > held at the point of reclassification. That assertion was copied from
> > nvme-tcp, where the socket is created internally by the kernel
> > (sock_create_kern()) and is never visible to user space, so the lock
> > is guaranteed to be free.
> >
> > NBD is different: the socket is looked up from a user-supplied fd in
> > nbd_get_socket(), and user space retains that fd. A concurrent syscall
> > on the same socket (or softirq processing taking bh_lock_sock() on a
> > connected TCP socket) can legitimately hold the lock at the instant
> > NBD reclassifies it. sock_allow_reclassification() then returns false
> > and the WARN_ON_ONCE() fires, which turns into a crash under
> > panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
> > against socket activity on the same fd, as reported by syzbot.
> >
> Given the syzbot report, if you are right (I suspect) then Eric delivered
> another half-baked croissant, and feel free to cut it off instead to make
> room for correct fix.

Nobody (including you) caught this.difference between nbd and other
sock_allow_reclassification()
callers.

What was the "correct fix" you envisioned exactly?

