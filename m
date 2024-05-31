Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3738D5B2F
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 09:06:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E69A520571; Fri, 31 May 2024 07:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 07:06:09 2024
Old-Return-Path: <idryomov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A02A72055B
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 06:48:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q5aJv523NPnD for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 06:48:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-oo1-xc2a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2817820558
	for <nbd@other.debian.org>; Fri, 31 May 2024 06:48:27 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5b2cc8c4b8aso865404eaf.1
        for <nbd@other.debian.org>; Thu, 30 May 2024 23:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717138104; x=1717742904; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHfXsuY+pdYsu6JkPOmIMiIuAZ41w4yugEvYSYmSsZg=;
        b=BAs9vPdUMs6U41dFQxuhO1eJXne8rfXGYah/iFnf050DaiTimJq1gTVqfRKyIlMvUX
         oCBpZdec2a8yIAUkfy1nhZEBzrkw3hRig5VJWHklcu+puMsEL4ahGpnIqS6xglVgtYI3
         hRcHymJmGkmAzLPy7kXFfHVOoYkUGmtjXH9+k7NueJOTJPO0/us14pgnNwcNxJwydFWe
         QVNZPCBht9OInVYLAGG4i3cDy4CzEXzW7VVuH0wcYLRXEprEmFnm/GgGHNUMDkxWEP+q
         DNs5/Pr80z3VTEnd+bNjJvc112NDD7wo5tZxrgmcXGOORfgL0YHzr4ScQ2TILZ0o6gps
         byIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138104; x=1717742904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHfXsuY+pdYsu6JkPOmIMiIuAZ41w4yugEvYSYmSsZg=;
        b=TQfYgC4/sm2Dy0Up4Imj9+Fn6i23WyPw1sQ0VPsQ+28dylvzSk+oXKej0E2ZUafTUR
         F4fR0E7+SBhDdAmmKgPF8xp/t1GYXHr8xWbnJeJdr//UehLsmXIBdoSAWSqGTCj7YkDk
         9xFld5vc5zAI7tU2tngtThO8GIUV7ZCDJrkvZniNWpP9KXXNRGVXNYAlpVDhGzI6faJ3
         R53Bli/5Ly/G84toPkBf8njOe7EcQ2YbvD24eAHVtf20azjm0kmphk0awzT7KuQFGRaD
         ZZunRCnvmf5w59Wod36Oeub7Ul5mEw1vaMgw8lyaSygdFr7lCulRR8L4i2smR0/wUIUs
         p2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZhQOxsZImP+rM+UyBLDbjxKhXkS57sTgXwIwLmoAj6xXQpJt/BJV8RJwbKVVxLA5XqTBmPTPN3aO7t7WfqS7rS4OBsA==
X-Gm-Message-State: AOJu0YzJNrcOIrWAVkOZZJZMxuulEvybt4wYz++4GeztwVUSjHAstS/p
	h1gI2a0BuBkvPbQUzOeb5ke+Xy5LfxLwcIoXWMrNjnv5WHcy+97b1j6UQAhI9Cs1+x1PXnb4xas
	8/g9verQizpnKS4xcozwwZz4Zmzw=
X-Google-Smtp-Source: AGHT+IEkgVU5yVpc+xeOYwUOJd29bp6vThPd4yP1XUDfgboWzFw/FVhH/FxeC96crk9g7iXBffgH6P0YPBoJ35FyjnE=
X-Received: by 2002:a05:6820:151a:b0:5b9:70f8:4b82 with SMTP id
 006d021491bc7-5ba05e1f5a1mr1238669eaf.9.1717138104409; Thu, 30 May 2024
 23:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de>
 <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com> <20240531055456.GC17396@lst.de>
In-Reply-To: <20240531055456.GC17396@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 31 May 2024 08:48:12 +0200
Message-ID: <CAOi1vP-VXeOH-kShRKv-b=id1zN9tLiqOo8EKpOWoJuQp_Pm1g@mail.gmail.com>
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for max_sectors
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, "Roger Pau Monn??" <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nv-mEvRZveM.A.lXMH.hbXWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2855
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP-VXeOH-kShRKv-b=id1zN9tLiqOo8EKpOWoJuQp_Pm1g@mail.gmail.com
Resent-Date: Fri, 31 May 2024 07:06:09 +0000 (UTC)

On Fri, May 31, 2024 at 7:54=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Thu, May 30, 2024 at 09:48:06PM +0200, Ilya Dryomov wrote:
> > For rbd, this change effectively lowers max_sectors from 4M to 64K or
> > less and that is definitely not desirable.  From previous interactions
> > with users we want max_sectors to match max_hw_sectors -- this has come
> > up a quite a few times over the years.  Some people just aren't aware
> > of the soft cap and the fact that it's adjustable and get frustrated
> > over the time poured into debugging their iostat numbers for workloads
> > that can send object (set) size I/Os.
> >
> > Looking at the git history, we lowered io_opt from objset_bytes to
> > opts->alloc_size in commit [1], but I guess io_opt was lowered just
> > along for the ride.  What that commit was concerned with is really
> > discard_granularity and to a smaller extent io_min.
> >
> > How much difference does io_opt make in the real world?  If what rbd
> > does stands in the way of a tree-wide cleanup, I would much rather bump
> > io_opt back to objset_bytes (i.e. what max_user_sectors is currently
> > set to).
>
> The only existing in-kernel usage is to set the readahead size.
> Based on your comments I seems like we should revert io_opt to
> objset to ->alloc_size in a prep patch?

We should revert io_opt from opts->alloc_size to objset_bytes (I think
it's what you meant to say but typoed).

How do you want to handle it?  I can put together a patch, send it to
ceph-devel and it will be picked by linux-next sometime next week.  Then
this patch would grow a contextual conflict and the description would
need to be updated to not mention a behavior change for rbd anymore.

Thanks,

                Ilya

