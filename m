Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EU/5J+xxQ2oUYgoAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 30 Jun 2026 09:36:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D586E1351
	for <lists+nbd@lfdr.de>; Tue, 30 Jun 2026 09:36:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=QGRRtLuj;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2152220A6D; Tue, 30 Jun 2026 07:36:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 30 07:36:12 2026
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F14DD20A4B
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 Jun 2026 07:20:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VKTbx2WrISEv for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 Jun 2026 07:20:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B6E7E20A45
	for <nbd@other.debian.org>; Tue, 30 Jun 2026 07:20:01 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c04bf4711so19765541cf.2
        for <nbd@other.debian.org>; Tue, 30 Jun 2026 00:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782803998; cv=none;
        d=google.com; s=arc-20260327;
        b=WBsDR3aPBDiP+lM8s5X4PtZG1+pKtnD6qfaY3YRcY4uCkANyy5yJ3RkjRgMOMJVKAL
         au2hLML1rN0uu/pEZyUr4RpeYpREp7BccY8+PrmIaRHKHgrc+gzD8xMvM1yFqZsbC0AC
         bMhlI2aCHSgV6nwOVd7hU+2BhylYyisejH6uXp7CAtQEGBfI6VUIjv6xa8OdzuXKWaMs
         9jYpJBGXyaorFwrjqF4x8onW/iuVbmOGAYevTQNF0RBvPPx6/TsXjmyWbVn4VDe21+uV
         Ny6EWx4kX2Y/edOqAPuMtELGNbUCF//4FIcXBVLCJw8kdUhbdnrRjQZA8eWonOR+hXp4
         6frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F28JSHUvtIiMJrHZex2q5cijigT1XfCkWVMp0pOXSGE=;
        fh=oTKuCUu9MLgVExB4uAoZrpqVu814NLx6ruOBvpWJOSo=;
        b=cUNGPKZpOr3biygTE42L5e2cD1WtrPYY4VFprHxCqFPr4vQnD+OGMr5lar602SKXwx
         wrsYmlF+g+yXurYUT00FsTutumBBs1u7HpVAfAIWt0K3D7fKRwJZo0wgmkhxUW7vWCmL
         btEhUsvSM7BFPWU+zobNPKx/WVTJkX1D0253JNlbM0NPaEtw7neXlcx29Ac2CC0VYeSZ
         /67QMKwA0wxTt4lQOLu1ENuP1Wg4KXZC9SkOhaCCN3hLh+pLIvCP2MzpV08O4nTvi6d5
         OcLQqOE1P5dU370YbXdWFbesESVQLBEUFC+QgeDRx+5BHAAKuqcTqU7R77r4HfiMIam2
         qVYA==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782803998; x=1783408798; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F28JSHUvtIiMJrHZex2q5cijigT1XfCkWVMp0pOXSGE=;
        b=QGRRtLujRvhEQXaalkiIX1/oWt88Y0k/aWUHSSRSuQBqxUNxBdfrwRbsXOyxxUOPyG
         eCZ7jzjAFHN2tjT9pjDo3ZtLcFAQJpZh/odAG3UDs/xdb6EMT7lAgbU7duG30gXjomZl
         z9w+PbVA1Grl3md9Hi723iw1CHI2hQqywpj2+o3if2jMUnDKTsMlenfnPoLI5WwBVvLH
         tpZ/t0vY7vE0137nxGpTF+wsdMi3Vl6n+oW/XrITA0UbsiMqGkwoJJHFKkVlmmtSP5Fa
         L53azxGTNe3TNf1dgzUJK4pQuyp6O0tHNpTh8NZL3/OnTtgXcLJOxplyyfYjSwe4TqQA
         sZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803998; x=1783408798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F28JSHUvtIiMJrHZex2q5cijigT1XfCkWVMp0pOXSGE=;
        b=SkNz04P0aJxUdWpRDnfVkovyjYe3RReakDgCXSIk4tob+dOHr6eSetF6UvEgJMgx4R
         f720PldsPXihL0m0iMgAIS9FhGmtjWjCAxIq/MUuLQU6B49kQid1bhRpnhTEGDAbSm2q
         E4oN4/aK8zzoJ/SnuQabZ1gYfMZ6ACQtJnFfRPzmI2dhZ8lKUKA+Ozj5L0TuBJs94gf2
         5RIboCEHWVOSZ4AkQ2mk5PdOLMehI9RRoZyU7e+NnHQpo7QOOZDfYLucaEMbMn4lzvap
         YjDmZ3e6AaL6CFM1+FtJyAiqI92WM/B4UdyLrw8eAEfixarboQkKSNz93zw6QY8n2YbV
         Q2tA==
X-Forwarded-Encrypted: i=1; AFNElJ8o6Cg2xVL184NQUQ7O0VSujaZkpd1kp5QFaVuYgkSWwuhIMEl1RSNMlKiMjkJZTVBo3ck=@other.debian.org
X-Gm-Message-State: AOJu0YxWrfddn013tZSzXhH3sMh5Xcd0D4AfOUgdw1JkpaArpjz8z6Ay
	gZB3Gjxr6ooRQUnTCR5g+9MyESfpvkydy38RP61AUOswSKnUGtGFcjUxvfbtptiTPxZrf7w8M63
	Q94FYqMAdjimpaKwYvkUv0hgIef6BCwHN6GRUZ7a3
X-Gm-Gg: AfdE7clfVHjV1nkBs/W/K4lduDEV4UHayjbnK3sicBt1natSGfqpPXfCIVjzprcRTVQ
	yqbRJHjiVbWvIjGNa2qwNhUFkjNrpSP712BI+NW90ip8QM4j0ypqxGxi7jDkOELKLyQRnxI7r+H
	rdoSXCZdFeur56NIHKFo81Bna7cp9iruhc0R8EvHEWS5qzTtF7Hox0zE1/BVIwsim8jBiP16x6p
	a1dVjP+BFn8/7WcsefvgYfBC99unyOkwTjx5FpJniE7n1KxsZQWfvTy3UuRL/cv/dhtIIZZIC5P
	2TEqdE4FE8uQrxiGFn29Vu7+ivotM2diPV3excemPOMe4np/dcCQRJMiw3EdkZjt6l7QyqaLG32
	DyfqzEKJV
X-Received: by 2002:a05:622a:1304:b0:51c:981:94a6 with SMTP id
 d75a77b69052e-51c107b21b8mr32148201cf.23.1782803997273; Tue, 30 Jun 2026
 00:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANn89iLPWCo_u-8jCsDM6jjZYfESvtUt9n3xD7yuAyNNntSw6w@mail.gmail.com>
 <20260629052854.252-1-hdanton@sina.com>
In-Reply-To: <20260629052854.252-1-hdanton@sina.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 30 Jun 2026 00:19:45 -0700
X-Gm-Features: AVVi8Cefl2XQm68lhL58TMM5XfBLIzHlOMqm7XlLDyUcPbD7Erz5hlsvmGjm4H0
Message-ID: <CANn89iL-RTVME9qcUSVZW6qBEkVh8suw2pcLMCh0WM1fTEz6Jw@mail.gmail.com>
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
Resent-Message-ID: <J8sUl0l1KqM.A.b_OP.sH3QqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3575
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iL-RTVME9qcUSVZW6qBEkVh8suw2pcLMCh0WM1fTEz6Jw@mail.gmail.com
Resent-Date: Tue, 30 Jun 2026 07:36:12 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.51 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[sina.com];
	FORGED_RECIPIENTS(0.00)[m:hdanton@sina.com,m:kartikey406@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,other.debian.org,syzkaller.appspotmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sina.com:email,bendel.debian.org:rdns,bendel.debian.org:helo,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42D586E1351

On Sun, Jun 28, 2026 at 10:29=E2=80=AFPM Hillf Danton <hdanton@sina.com> wr=
ote:
>
> On Mon, 22 Jun 2026 17:21:53 -0700 Eric Dumazet wrote:
> >On Mon, Jun 22, 2026 at 5:07=E2=80=AFPM Hillf Danton <hdanton@sina.com> =
wrote:
> >> On Mon, 22 Jun 2026 01:18:10 -0700 Eric Dumazet wrote:
> >> >On Sun, Jun 21, 2026 at 6:43=E2=80=AFPM Hillf Danton <hdanton@sina.co=
m> wrote:
> >> >> On Mon, 22 Jun 2026 05:22:55 +0530 Deepanshu Kartikey wrote:
> >> >> > nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lo=
ck is
> >> >> > held at the point of reclassification. That assertion was copied =
from
> >> >> > nvme-tcp, where the socket is created internally by the kernel
> >> >> > (sock_create_kern()) and is never visible to user space, so the l=
ock
> >> >> > is guaranteed to be free.
> >> >> >
> >> >> > NBD is different: the socket is looked up from a user-supplied fd=
 in
> >> >> > nbd_get_socket(), and user space retains that fd. A concurrent sy=
scall
> >> >> > on the same socket (or softirq processing taking bh_lock_sock() o=
n a
> >> >> > connected TCP socket) can legitimately hold the lock at the insta=
nt
> >> >> > NBD reclassifies it. sock_allow_reclassification() then returns f=
alse
> >> >> > and the WARN_ON_ONCE() fires, which turns into a crash under
> >> >> > panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
> >> >> > against socket activity on the same fd, as reported by syzbot.
> >> >> >
> >> >> Given the syzbot report, if you are right (I suspect) then Eric del=
ivered
> >> >> another half-baked croissant, and feel free to cut it off instead t=
o make
> >> >> room for correct fix.
> >> >
> >> > Nobody (including you) caught this.difference between nbd and other
> >> > sock_allow_reclassification() callers.
> >> >
> >> Nope, actually it raises the question -- does the deadlock still remai=
n
> >> after your fix without the lock key you added applied?
> >
> >LOCKDEP might have a false positive, but it will be much much harder to =
trigger.
> >
> >I had about 50 syzbot duplicates (that I did not release) before d532cdd=
b6c60
> > ("nbd: Reclassify sockets to avoid lockdep circular dependency").
> >
> >>
> >> > What was the "correct fix" you envisioned exactly?
> >> >
> >> Frankly I had no evidence against your fix a couple days back, but now=
 I
> >> see your lock key approach fails to take off. And the correct fix is t=
o
> >> erase the incorrect locking order ffa1e7ada456 tries to catch, more
> >> difficult than you thought so far.
> >
> >Which incorrect locking order are you referring to? This is a LOCKDEP
> >false positive.
> >
> For archive purpose, syzbot report [1] where udp was not invovled defies
> what is fixed in d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep
> circular dependency") -- "Since the UDP socket and the NBD TCP/TLS socket
> are different, this is a false positive."
>
>
> [1] Subject: [syzbot] [net?] possible deadlock in inet_shutdown (3)
> https://lore.kernel.org/lkml/69c37e6a.a70a0220.234938.0045.GAE@google.com=
/


Why don't you send a patch if you think one is needed?

