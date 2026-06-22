Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a02gJcv2OGrIkgcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 10:48:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0216ADE68
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 10:48:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=pu5lFtjX;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ED28D207F7; Mon, 22 Jun 2026 08:48:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 08:48:10 2026
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,GMAIL,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1F3BE207EF
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2026 08:31:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GMAIL=1,
	RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mUwWvgNBtpln for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2026 08:31:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x831.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5DBA7207E8
	for <nbd@other.debian.org>; Mon, 22 Jun 2026 08:31:52 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-517907feed0so51969011cf.1
        for <nbd@other.debian.org>; Mon, 22 Jun 2026 01:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782117109; cv=none;
        d=google.com; s=arc-20240605;
        b=h37f+4aB/8zPYNWsWfPX6PcL6WX4LI2+Jyhyf7/8Twolxf8sWb1Hycf74J+5wB9LMr
         6jDjSxRQqD2rlEZ00LouUL5oWyQZnxEgKjNu36r+PdstfYJUPyfCOy8CP1xACcylD4Ne
         Kvf8juocZsY1q8tQZyG/cVPlLZCePR54it0iM7ErrsFzS7v8rRHqQbv0BEKjvoeIssBj
         0FmTN/O4W068X6aGsQkli/s9huMZ7elrJsSAGCr7X8T2QUQQaLe9NQ3ClO6zeT7BDMfx
         mD3vqFqYbz+X/e4GvF22UTjzSecRMJGzYPPsadHzBarp86WkkHLKajSr2e49ytZJjDLl
         dOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ig7N46VIRPdHLHwAftM4zR7B+ytNecdkZgiaA4Kj/To=;
        fh=7qeHzlToAbamLAnidgZFFbkux3XZHQ9K2IGpj7IqTVo=;
        b=Kh3F8vG2gnwTf+1TQK8f7Ah4HZLUOsJ4QbM2ub/DmkcmtCQPSEmgLJegi+N83J6Xfq
         tnS3p5bbZM0QghCzCljhuTA/a3ZQq53BDfu11hzSydndggX1mgG4R9WYZ4SW9LyVlyiI
         HbaeSoDsxdqU42hU7oQcjhBqnoz/Zls33R70F2YsyTV1UUIiJ10j5bpyjtyXARqFu8Si
         reAlMBvDVXk7tfdorS7GZENdkkkXopnanScF0Kt6sCI1TFyXdobKpn6NAgzow/Aeppt9
         YbEKfOgVkdzjGyd213LsHBf2zk+CTFyw4H/UpxDWsuwZ8I5R2Q52sWl2H6sQyeDyh+LW
         M3LA==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782117109; x=1782721909; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig7N46VIRPdHLHwAftM4zR7B+ytNecdkZgiaA4Kj/To=;
        b=pu5lFtjXEm2MZNYw0EHTV/E+KvDoPHcu2+JhQftnj1MGCpdYotX4vwk5kcZGmzOL0o
         AmnHOfpRzEzGZY9GGK1R9Wqpy6Z2tak/0qHafNlI5svod0jXURS2s+cX6iUbD7cr1WF5
         QR9U7xAk3SBqneMod6wWkk/i1eO8lZJlASFZOXzdrTJGUFa8+zGV/oF00qBVNlRZSo+Z
         vc4atvSpgb6F3KUbgcX9QpeTwDA1orIoVzdCvId03OybboyvgLC8FCTLUBA0ozSLqA1L
         VggNelpzPIn/GsT3HsBT3AkzOAZsi9OWCTRUlt3yXE9dCkz7M+ZZZGZimdVk8WdKgruO
         r78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117109; x=1782721909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ig7N46VIRPdHLHwAftM4zR7B+ytNecdkZgiaA4Kj/To=;
        b=jR2NBmCuLrgvQqFTDhej83tzQr+Fxv0npU2pMO5C8QVXK0AXyu7ij+lEd9fsKo4FW0
         c/TmMXDS02eWnaxRK/REpxYO6g+BCeveik7NmmxSh2h5Bm61zWFLeOEdForgjnS07+Ia
         FPtr6bAYkHHgKmzV2fKY/3h4ml7VDtzxYn0O+gu0kcQzwqJPYiyL1eb3s/1ILXfedcjt
         4u3/JOG9XXEfPg+g1wquIFiWqP83AEWqC0Eh1EoXS3Oa4JzzrFZ66GImIBEC23UthtLS
         1qoXTtIBsykqiEv844xe5pRtNiWjnxWQMpEth550W973a14MuYV3IInrWNzp/JQ9ICX7
         0Zeg==
X-Forwarded-Encrypted: i=1; AFNElJ8TpQO+JV9DGCRzRG+po1XErHaw3CWCRSu47lTUL2/s0q59I8y8SHxHt4B1MLr/5ep6pIE=@other.debian.org
X-Gm-Message-State: AOJu0YyXJt/4yTmHlqSNBzvje7PC17pms1MU1dxcF+eaIOEc0Vt6gSy5
	70L6zVHpCzNmbxfChZv734efYGtWvSKJo/hhFKyIkW95RdwGeBopCr85Yl7+/oGVnZM8ZE3wQQt
	hLceVW/lb7md3PKUKmDFqWd7kbYiB26XNdiVK0Xer
X-Gm-Gg: AfdE7cn6MzfNDnT+qxFeK08HHHtz+AumI4RrMDtIOiZ4V+dybpTRQqy9GMfEeQ8Rc5M
	yIZm0mWOy0cwDzXlqRDvy73sgGZWhaC1ucrh3Y7dUTwT2ien28hJk9egO4unXfR8HmdTQE4TJ8F
	z7c3pDwzLxusdQpyhrGqGW/rI647mYKavmu9z13Lu3F7ooGk4W2uImh2QQc+J9pzYqaOD3taEPe
	5Ps6WN4kqXkp2w14MWekQplSsOCeL+CUrvLkaOrdfv/8xh7o1JJkOXLmNgejbSWHhdu8ZmuMisH
	es2x0+0rkxsnzpMaBA8xxSrPORB/hHOsTv8XGVWDxRuG9dWJRRB5sojcmc1CgFchKgOvS0GsN4w
	xEHCUMFNvwZqydXs7GCw=
X-Received: by 2002:ac8:5f4e:0:b0:516:ddfa:b6b9 with SMTP id
 d75a77b69052e-519e66509ddmr120243541cf.23.1782117108133; Mon, 22 Jun 2026
 01:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260621235255.66015-1-kartikey406@gmail.com>
In-Reply-To: <20260621235255.66015-1-kartikey406@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 22 Jun 2026 01:31:36 -0700
X-Gm-Features: AVVi8Ce7w-soiHgBKLGE9ut0Bz1-9KSRdqKSJVe3-LxE5mWN0xgtRYb-cNEzQD8
Message-ID: <CANn89i+ZE5nEMvhxJQAUp3WgyVLpQCdDhKbx1EqqQTRUtzVLeQ@mail.gmail.com>
Subject: Re: [PATCH] nbd: don't warn when reclassifying a busy socket lock
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-kernel@vger.kernel.org, 
	syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7xquTF8jKxI.A.i_-.KbPOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3555
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89i+ZE5nEMvhxJQAUp3WgyVLpQCdDhKbx1EqqQTRUtzVLeQ@mail.gmail.com
Resent-Date: Mon, 22 Jun 2026 08:48:10 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.51 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kartikey406@gmail.com,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	DBL_BLOCKED_OPENRESOLVER(0.00)[other.debian.org:from_smtp,bendel.debian.org:rdns,bendel.debian.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A0216ADE68

On Sun, Jun 21, 2026 at 4:53=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
>
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
> Hitting a held lock here is expected for an externally owned socket and
> is not a kernel bug, so skip reclassification silently instead of
> warning. Reclassification is a lockdep-only annotation, so skipping it
> in the rare racing case is harmless.

Acked-by: Eric Dumazet <edumazet@google.com>

Thanks!

