Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0HGcLLPVOWomyAcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 02:39:15 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBEF6B3025
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 02:39:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=UrheyokC;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 427E5207DB; Tue, 23 Jun 2026 00:39:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 23 00:39:15 2026
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6B228207D5
	for <lists-other-nbd@bendel.debian.org>; Tue, 23 Jun 2026 00:22:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pFT_3d0jdjDr for <lists-other-nbd@bendel.debian.org>;
	Tue, 23 Jun 2026 00:22:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x833.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 65054207D4
	for <nbd@other.debian.org>; Tue, 23 Jun 2026 00:22:09 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-517907feed0so4191031cf.1
        for <nbd@other.debian.org>; Mon, 22 Jun 2026 17:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782174126; cv=none;
        d=google.com; s=arc-20240605;
        b=U/RG3bA9l/Tm+FMRgd8Vg3Z1oy6DULdr63KBx+xg0mwSnJziiGC8GxPxL9pB5WW8OC
         d3o8jvyYnreyKilVCN/lV3i4DIDUEAp1FtosGfvb04hRzZs53MrSqcEaADttKxgGx5i1
         ml8JLwJCLoXHPwVF8ARX3azCmSu8Rek3CyRUxNN81C836YsyJbQ0NXq67jUfu03ecc0R
         Qh79x04o0lEKoRKkGN/DVG+cqjauPmbNtbu4fROtB81jPQylmwOz4bfXCxDW3f+zSX+5
         pBNVY7x4MWZ/TgThGRpHuybfdS8J2HE9CjWve2xg827jWoM+7wCnfC+L8Y3BMY22F8P5
         U9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIuY5a2HKJO6h14/lkjaRYtOWipwqSkPLwZPgqIxLZI=;
        fh=ooi2NJRETgQZYRgzcLYD9crruZ37+cSagQ+UAEjXYy8=;
        b=Ko/Cbbc1wDvPQ0AJjNjhnWVI/RLO68LZ/UrD9smt31QPW8FmX1xpgw5k4fMJXCSI6D
         s0eI1IfOIlQ+zSdmnAuLv65YFwa6kHgU+AnkxixB3JEfPwEvrOIAMRZw2qTxv01+w2pP
         3WXkrxQom3sIpx+arDAwK/g/CCUOG5PTpf9XLNngZTcnOsiiPg+W7kwT+Q1CyrIu8KYY
         7RL1toyhiSBOJ4oLP/8VHES+mmRc+dpwrF7u0FtbZBZhTpgFz3tiQsy8sk+lJXqtsVgU
         YNqlpUnp5TYGwiKL79I+bT4BeJtdd7fHAio0dsHUf/+DfX+1V2PYRCjJvcFzFguAUDBe
         fVMg==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782174126; x=1782778926; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIuY5a2HKJO6h14/lkjaRYtOWipwqSkPLwZPgqIxLZI=;
        b=UrheyokCdReGJwLZm3+wQ/jcfQtOVFUEOdVxdDdjZofyfiSQ27fmXtsV9KoW4HspJb
         r1RMBOBmP4vCLfiMN3sK2gJCT4MX7ZOFxEMW4TGAaYJZtHs0QjWXMIf4Julf5r/cXBiK
         RfBScOvVobJE4fH5vBnHcRyfIyIwDT0PHSiv1Ebqgf1tjSo6q51e4L+GsMk1stgQNi3w
         EmOL23j8Bk7Fss22AfoY4Jzhc7xiWLQfEYAAGQRr/MiLDw1F4zPgUFk1RrOFo5i3G39z
         vpyik62GPCZopLzdb+ap6HYjUBBco8qM1fQaWxkxKXnJs/ty6uQfL2iqS6ATPzaFEHVz
         BOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782174126; x=1782778926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RIuY5a2HKJO6h14/lkjaRYtOWipwqSkPLwZPgqIxLZI=;
        b=Jx/wKGoLKlxYEi6RmkcUUTm4YlLlXpfd4YGsUIXVQ6J6GSqD7U506fR8k4zrbmXVug
         ejkWeuD63RBnohybJAcs+bZNMWpU81tizME1R2lbO+zWtLiSd41kbiU79adTOfk3HUIR
         khbnXaww/azaNaV48w64dsb1PTai0o/PHKm+pK5vvx3bYQvFEx8JJ8ds+nVoops9bKCa
         r5MxiSTfkD/ENBQtlt4HOqLtyzgWOTWviwGUZdjnnXry7R8YGE3P5oGn0w2TGfg1187W
         8VCcfaTmcyeEKVPpZxjrAzXjarvMvghcM+aq5v5trEtiHwVj5+UzpvA8Ix5oGRpcgcP7
         PUdw==
X-Forwarded-Encrypted: i=1; AFNElJ/Z7vgsjkQ8I06RgYa0dOhH1wAeqkhrQskSKn8nwBJY+uDVdwcSQhMX00Fm7dbzLMbwkrI=@other.debian.org
X-Gm-Message-State: AOJu0Yzq3zMIUI3oiYBMLBka3MBWleTiVZDRXFiHlx2l8rEpGtpGh7LJ
	50ZzbIy/VG3iiZJFH2n8CvXZ0vjz2pSeJdPrUq9GII12Vd4YaplguEjPsiufCEnNhferD7u0RAu
	YZd2RwfAvvy76uOJyLjnTJfSrebVCFtza5zPwZcx6
X-Gm-Gg: AfdE7clGqIS5wzRFXeT6GW3GzyqB6u8xGg1bKnpzqSH7b1my6B5OfJE5VSDwPRkF3vJ
	y37gcYP/mQAI0PnDb+NY35TK/j5PmwnHbEdyemtt5Rrn0pbJ9G5eFpd3A0+N9spgS5TVPXW7FFH
	t7qSJ8yxkwzas09XHTJUJNXhcxySg3GZkK/VcH/prrNoc+Mpe+OncvP2/qY8AeOd2+fjP+3mn+7
	4bGdnELr1mitz+BHbWJRxcFD6REhDVx12rXcy6y7B5CB8AbWWFXp0pCcGzjNWPMCuXpKSLhJfPX
	h6Sd3k6ZiwSvMgwW7x3OHt0GE9RQfaNJlX/5SBL5VcqJT83U+qMcSSl/WBeYk8lu3fGMdGXIuLQ
	n7zXSxOA0
X-Received: by 2002:ac8:57c8:0:b0:513:e686:b361 with SMTP id
 d75a77b69052e-51a51794604mr23792491cf.2.1782174124992; Mon, 22 Jun 2026
 17:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANn89iJBomCNpwzOiYHmmPf0i3KQGaqoiKh6VFeM6NHOQaCn3Q@mail.gmail.com>
 <20260623000723.135-1-hdanton@sina.com>
In-Reply-To: <20260623000723.135-1-hdanton@sina.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 22 Jun 2026 17:21:53 -0700
X-Gm-Features: AVVi8CfjcFjX-lSy17ur8ZhZC6YM0G5CgTrGQiRsMgjOp8hORMT5Fa9cgvOgEO4
Message-ID: <CANn89iLPWCo_u-8jCsDM6jjZYfESvtUt9n3xD7yuAyNNntSw6w@mail.gmail.com>
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
Resent-Message-ID: <_y-kFrEgOML.A.IJVL.zWdOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3558
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iLPWCo_u-8jCsDM6jjZYfESvtUt9n3xD7yuAyNNntSw6w@mail.gmail.com
Resent-Date: Tue, 23 Jun 2026 00:39:15 +0000 (UTC)
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[other.debian.org:from_smtp,sina.com:email,bendel.debian.org:rdns,bendel.debian.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CBEF6B3025

On Mon, Jun 22, 2026 at 5:07=E2=80=AFPM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Mon, 22 Jun 2026 01:18:10 -0700 Eric Dumazet wrote:
> >On Sun, Jun 21, 2026 at 6:43=E2=80=AFPM Hillf Danton <hdanton@sina.com> =
wrote:
> >> On Mon, 22 Jun 2026 05:22:55 +0530 Deepanshu Kartikey wrote:
> >> > nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lock =
is
> >> > held at the point of reclassification. That assertion was copied fro=
m
> >> > nvme-tcp, where the socket is created internally by the kernel
> >> > (sock_create_kern()) and is never visible to user space, so the lock
> >> > is guaranteed to be free.
> >> >
> >> > NBD is different: the socket is looked up from a user-supplied fd in
> >> > nbd_get_socket(), and user space retains that fd. A concurrent sysca=
ll
> >> > on the same socket (or softirq processing taking bh_lock_sock() on a
> >> > connected TCP socket) can legitimately hold the lock at the instant
> >> > NBD reclassifies it. sock_allow_reclassification() then returns fals=
e
> >> > and the WARN_ON_ONCE() fires, which turns into a crash under
> >> > panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
> >> > against socket activity on the same fd, as reported by syzbot.
> >> >
> >> Given the syzbot report, if you are right (I suspect) then Eric delive=
red
> >> another half-baked croissant, and feel free to cut it off instead to m=
ake
> >> room for correct fix.
> >
> > Nobody (including you) caught this.difference between nbd and other
> > sock_allow_reclassification() callers.
> >
> Nope, actually it raises the question -- does the deadlock still remain
> after your fix without the lock key you added applied?

LOCKDEP might have a false positive, but it will be much much harder to tri=
gger.

I had about 50 syzbot duplicates (that I did not release) before d532cddb6c=
60
 ("nbd: Reclassify sockets to avoid lockdep circular dependency").

>
> > What was the "correct fix" you envisioned exactly?
> >
> Frankly I had no evidence against your fix a couple days back, but now I
> see your lock key approach fails to take off. And the correct fix is to
> erase the incorrect locking order ffa1e7ada456 tries to catch, more
> difficult than you thought so far.

Which incorrect locking order are you referring to? This is a LOCKDEP
false positive.

I suggest you send a patch so we can discuss it.

