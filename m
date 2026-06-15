Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gBwkN9qzL2olEwUAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 15 Jun 2026 10:12:10 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D46846E7
	for <lists+nbd@lfdr.de>; Mon, 15 Jun 2026 10:12:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=bAr4IPHk;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2B8BD20778; Mon, 15 Jun 2026 08:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 15 08:12:10 2026
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1659C2074E
	for <lists-other-nbd@bendel.debian.org>; Mon, 15 Jun 2026 07:54:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id w1AhlV0UZY0k for <lists-other-nbd@bendel.debian.org>;
	Mon, 15 Jun 2026 07:54:01 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x829.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3BC0B20739
	for <nbd@other.debian.org>; Mon, 15 Jun 2026 07:53:57 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-516d0db9372so25320091cf.2
        for <nbd@other.debian.org>; Mon, 15 Jun 2026 00:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781510035; cv=none;
        d=google.com; s=arc-20240605;
        b=K05YCfp0nK8iFYX3iLsCgqPFjJAD4AX03b3b7BkUFGynXuqOsnbYIb6f4Yy5uHpK61
         VkRazqZVT9eNCiKCjhxJDCMu9ZWR+ae1Ue2XLJEgHPOYOLjrHZYKBGMYOiMTzlNnsLTB
         AFiQZ96CHveI+hTsJRyXqbgYVfOubekIacZlSNkH8XmZL+WmwQab1vO0QE1XpJFqNbLR
         E7vZy9b73MMN9bElxTxLIIHvh1PUk6TUo6Ntqzgfb3e5MuqB42yOc5p/+cLjvmwCqylc
         dXD8Jk+6aLzKWu45IulxeZXzTKixsvGFaai1eXd0pM0X9MiCZIVYC5BAS0GlLneUBFfs
         kr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iqFN/tpX3q6tjB+xBeLewyCE5xHFkLdK34oVqtX0Nhc=;
        fh=zhyAvBkCNV0eCqJhxtDNBz5onJzpdQS7r7rMXrzX+90=;
        b=XT2CrWhYzNLL8dncr14A6rd/Zg76QK9e0/lmOGE++lgTTeSiIwHStruFiZ5T0ymPdj
         Va/U6glqdpfbXKRKYw1Ms4dwn66QmwcArg0Lv3WeYx0cMxNUWkUoyg+y8ugCXDVqOxDv
         Je6OB4oGgcS+kE/q0G6LQBXd2k3U7zGWLug4kYzyXjdjWv2ZG40tAPTjh/8bcK5skR2O
         mp+PNDc0rm6kME2fq/xkQTTj2ia9gy8NYufeGV1U2F88odQTTeoDp0dOmkRaG6+QuJ6k
         j/YF8S2PSxzctPXWjpheTjUTA9lGRjhpzHMcDUQSL/e3tVRKxj1lIM9BXRv607gNszSR
         mTkg==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781510035; x=1782114835; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqFN/tpX3q6tjB+xBeLewyCE5xHFkLdK34oVqtX0Nhc=;
        b=bAr4IPHk31ILGvm4vQIZo/wHrSM8muyoGKdKfrpZEjU1mSRbhnAH98I9p7wlbBC3r8
         pUIo6e3UG+b+axA1d0crnI8UIAarERdXfdot+Znvf020p04O2p9TFFXvlhHaamKLlQRo
         K8P3eZut1c+e/Ku+ystHw9snnHUeyHgEUsaB8t6o1W1+/u+9OoDF4zAwcGFr4yl6wESr
         zmDGJGOMhz9b9YoohnNt32nXPJwlNaSdwHvhIAq1o7Hhsc+H3F/RX+RCtDapC1DXJpJj
         LGJLE+5PlEeFV69zJaVqYQ4edmNJ95yXV33NhWHFcD6/7SNS6L07zNskK9mqf132YuuP
         pvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781510035; x=1782114835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqFN/tpX3q6tjB+xBeLewyCE5xHFkLdK34oVqtX0Nhc=;
        b=SwipoTXPRihligD2IdicmOUkAc5gBGKL9TCN78TXJNHIMnjDcpyjGGMrfp4n2prI8x
         nE8VQ9fxtF6aTFvgXNihT6TQGf4BcB0IeOZO7pyZvI8Qi06HBMZplhuLeZBzAHNovFVz
         +KPT42JJsIWmDh0XE+iIzY46q6Pn3uoLzaJUmyGm4sTdmBX0jznoGjxiXg3Y2Sms/UVG
         lvUR54dmlGLGCVbdPC0yPbAWgn7su9/2sak4illJK7AwNyJIg9hK0Xtb78Cw1F8dEjmD
         W802oc73b8toob4/6Yh1CcCQIq4VNG8Iup2gXXQSbfhM84VbrdbMfeAzPrqaly1Df8ee
         yZUA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ffrf2pHLgC6npBiZcOFqf6RAn3x28+N7luv8ZzMFnJoqS46ts1II3mFppRrsh143/IB0=@other.debian.org
X-Gm-Message-State: AOJu0Yy9R5L3PWypkq0N0eNQTo2AHsO8ucKcP3cekscdYeX54aJZ0e3Q
	akzfGEQlsJKcTYUgG/3yUMmaIMSg/qS+ekTc8yaBC6DGBVZBBbjXVtCIODC4G+6PeVmaGxMdlwe
	Lasz1Fqk8/bcsvBydbEFcKmjsecjNl1H/LP48c5nh
X-Gm-Gg: Acq92OHvd8T9apNJOBbeYxTx5BtLFLoCYk4c7ICecbTxPrn6oKJ7Q1E8G2D4NaC5XUx
	46MdLZbk/hksE4A5EELVOr6hXAWxJFb0THB6/rOSXUx+TYmwh2AfVkgGpDsSNH9GRnRIC0WkWoW
	Tt341jyBLDuGPrt18mHqxopesq7Nl5U+IjE1jUngW925QCxDFYPxsK735PUT1xmfTC392eE3jlX
	1WBL9TZBDUaKpEIbr+n7Lu2l/B4qikvXmUZU4UA8Nhomr8qIrm0JWbx2q74dRLqWdyYzrY9kqIv
	cUTpbhztP0DtngH8CUpBgGH1oJz8e274JuJ1RJxighCNpbWFhCBcQZ3YV2zrNkwsb6Bi79pUeNP
	+xFgig9ckXwfZqtpXRG0SbxfPjenEaA==
X-Received: by 2002:a05:622a:4245:b0:519:75f9:e874 with SMTP id
 d75a77b69052e-51976ed6934mr28436331cf.10.1781510034038; Mon, 15 Jun 2026
 00:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260613042619.1108126-1-edumazet@google.com> <20260613101214.1771-1-hdanton@sina.com>
In-Reply-To: <20260613101214.1771-1-hdanton@sina.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 15 Jun 2026 00:53:42 -0700
X-Gm-Features: AVVi8Cf6uGM8M8DJH4c64JCDlR5PdeR2re5zLcOyooPl5X-inb2su2lIUzphgfc
Message-ID: <CANn89iJq89KWm3eyfKTqjXhdKFy6raRLgfsRX8vXYgBpmBnDiA@mail.gmail.com>
Subject: Re: [PATCH] nbd: Reclassify sockets to avoid lockdep circular dependency
To: Hillf Danton <hdanton@sina.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3imcg_3UbFJ.A.lvcN.aP7LqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3551
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iJq89KWm3eyfKTqjXhdKFy6raRLgfsRX8vXYgBpmBnDiA@mail.gmail.com
Resent-Date: Mon, 15 Jun 2026 08:12:10 +0000 (UTC)
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
	FORGED_RECIPIENTS(0.00)[m:hdanton@sina.com,m:linux-kernel@vger.kernel.org,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:kuniyu@google.com,m:netdev@vger.kernel.org,m:syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FREEMAIL_TO(0.00)[sina.com];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd,607cdcf978b3e79da878];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sina.com:email,bendel.debian.org:rdns,bendel.debian.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 756D46846E7

On Sat, Jun 13, 2026 at 3:12=E2=80=AFAM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Sat, 13 Jun 2026 04:26:19 +0000 Eric Dumazet wrote:
> > syzbot reported a possible circular locking dependency in udp_sendmsg()
> > where fs_reclaim can be triggered while holding sk_lock, and fs_reclaim
> > can eventually depend on another sk_lock (e.g., if NBD is used for swap
> > or writeback and NBD uses TLS/TCP which acquires sk_lock).
> >
> > Since the UDP socket and the NBD TCP/TLS socket are different, this is =
a
> > false positive. Fix this by reclassifying NBD sockets to a separate loc=
k
> > class when they are added to the NBD device.
> >
> > This is similar to what nvme-tcp and other network block devices do.
> >
> > Fixes: ffa1e7ada456 ("block: Make request_queue lockdep splats show up =
earlier")
>
> Given the Fixes tag, can you specify anything wrong that commit added?

Nothing 'wrong'.

This (good) commit allowed LOCKDEP to throw a warning and eventually
panic the box.

A Fixes: tag does not imply the patch was wrong.

