Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307CB50094
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 17:03:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 362052059E; Tue,  9 Sep 2025 15:03:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 15:03:16 2025
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	RCVD_IN_DNSWL_NONE,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1BB682052C
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 14:47:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.581 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	USER_IN_DEF_DKIM_WL=-7.5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nbXpkHLocYvQ for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 14:47:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x831.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D6E052048C
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 14:47:26 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b338d7a540so73459961cf.1
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757429243; x=1758034043; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIPTmtHCDrJgBeBgHlzsCibUN0YnxA4RCxNX1u5+HrA=;
        b=w+1xSVQ+o984RMh/Wd+yLP5U2vGlLKRQ7AsEMFG2MB5my6SVb0QVS/p6zTCkRuRRTy
         s8+HyQ0gUiv7TmC0aYQzoRzzcmwFwnVYLSFS7LuFExMTCNn0vySfoOaSoj3MxBhyPCHr
         yGtGomoGCc8bw9ta1HSw8G/JvE4NvT+KMYDNqfCEan20rKxBQcdSTszTsMCN7dI7LHLU
         yYsBjtB6MAe3FI0xa9Oh9LEg6f1UWdt1rpvhpRu99EUfKqKedHHC1+vo8pEr2N6wti90
         KNUkV4NOz4NBqp41VhFmeXfv6M3/FpafqznK+BdhaaUzjyeHSawOcoff0dMRnL0Cy1p5
         Rj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429243; x=1758034043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIPTmtHCDrJgBeBgHlzsCibUN0YnxA4RCxNX1u5+HrA=;
        b=PArBKKtm4w5RL4+dMtG+PLNPtqdAyTgg5JBPjreXSE0Ub9FF7/yrFgfqhEUY0NRiLm
         L7Js/kbdg02byd3noC0cEZffH03Xy+uivBGSLCGlmoypCbpxJ30DCluIaS4Xc5CsIGU7
         HHbMhpFaizS+KN5ftrzHCxbjqUituXamOt832YTWnGbEM3DBmtobF1hUI49Fr9n9+lh4
         zoJ3grVwgFO33RhSH1Hw8PHXKgyS7T5n8HWTnZgPwX+IDAIvO+2GDYTuZ/4B74R+OBrc
         G32qFvzbmSSfh3x78kIc/p4eoHglntIS6TTJ4irYHDmstNqQnysyd3kAelnNiFxRFxbw
         nDgg==
X-Forwarded-Encrypted: i=1; AJvYcCUehYSZ6dUcGGtNaqSD13DMTnODtGQK0MvN1RV4MDI5WhPEwTfiG1IjhpLSiUrcgDa7iy8=@other.debian.org
X-Gm-Message-State: AOJu0YwunuqTphJZgopT9tKQjBTOtG3txE9FCnRevpf3LEpgyTNakhtw
	NjOo5Zk9dox5DR8PqzigurEh4qjaopnCfFDkNJhyixsRxqmbjlayDJKjWle/vWMAkU9v36wHmXi
	0/6L9TA0lIh1HOKMvdkuDvr6W4VX1FAQz2T5TfwTj
X-Gm-Gg: ASbGncsSTQAoAz80hHFGwrQ4pbylydNuZpZW/A8y17z6pF8kWGUsUW4F6sdfzZDvsgm
	HoIJKcVWXvCJj4C5i6k4IrboR5S0zsD4cNi4pAOKeGIjH68YFbmRaBtL7Yzu9rN/BjN2m/9cP+D
	fgl1kIUfu9/RcmuXmNWG+tAYGQyeG60jKMSikUZYf6vmBx156YTwGuOExFGOpEK9oCGUpd4LeYU
	yoQCh6o5nq/p1/eiFvDQ3NvmkfqQwt3rIsvv2G43CaratpiBe791ZXzMlg=
X-Google-Smtp-Source: AGHT+IHNkl4F/jlHneGYF/DVcUMGaWB8Yx5qk0wUjgE1GPGbrefbzEWPV3RJqRwpMoeMSkvolvqz8buuDcIXFrAO/fU=
X-Received: by 2002:a05:622a:28a:b0:4b5:e600:3d4f with SMTP id
 d75a77b69052e-4b5f844d163mr132837011cf.41.1757429242916; Tue, 09 Sep 2025
 07:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250909132243.1327024-1-edumazet@google.com> <20250909132936.GA1460@redhat.com>
 <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
 <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com> <63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk>
In-Reply-To: <63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Sep 2025 07:47:09 -0700
X-Gm-Features: Ac12FXzNtkWC68OEJylvLMh65_Zd3JlyhYqvJ9DDcC2NpONUi_gkcjAG5cZuFt8
Message-ID: <CANn89iJiBuJ=sHbfKjR-bJe6p12UrJ_DkOgysmAQuwCbNEy8BA@mail.gmail.com>
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
To: Jens Axboe <axboe@kernel.dk>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Eric Dumazet <eric.dumazet@gmail.com>, 
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com, 
	Mike Christie <mchristi@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>, 
	linux-block@vger.kernel.org, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oKq3xRjR7pE.A.65HD.zGEwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3437
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iJiBuJ=sHbfKjR-bJe6p12UrJ_DkOgysmAQuwCbNEy8BA@mail.gmail.com
Resent-Date: Tue,  9 Sep 2025 15:03:16 +0000 (UTC)

On Tue, Sep 9, 2025 at 7:37=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 9/9/25 8:35 AM, Eric Dumazet wrote:
> > On Tue, Sep 9, 2025 at 7:04=E2=80=AFAM Eric Dumazet <edumazet@google.co=
m> wrote:
> >>
> >> On Tue, Sep 9, 2025 at 6:32=E2=80=AFAM Richard W.M. Jones <rjones@redh=
at.com> wrote:
> >>>
> >>> On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
> >>>> Recently, syzbot started to abuse NBD with all kinds of sockets.
> >>>>
> >>>> Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> >>>> made sure the socket supported a shutdown() method.
> >>>>
> >>>> Explicitely accept TCP and UNIX stream sockets.
> >>>
> >>> I'm not clear what the actual problem is, but I will say that libnbd =
&
> >>> nbdkit (which are another NBD client & server, interoperable with the
> >>> kernel) we support and use NBD over vsock[1].  And we could support
> >>> NBD over pretty much any stream socket (Infiniband?) [2].
> >>>
> >>> [1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
> >>>     https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
> >>> [2] https://libguestfs.org/nbd_connect_socket.3.html
> >>>
> >>> TCP and Unix domain sockets are by far the most widely used, but I
> >>> don't think it's fair to exclude other socket types.
> >>
> >> If we have known and supported socket types, please send a patch to ad=
d them.
> >>
> >> I asked the question last week and got nothing about vsock or other ty=
pes.
> >>
> >> https://lore.kernel.org/netdev/CANn89iLNFHBMTF2Pb6hHERYpuih9eQZb6A12+n=
dzBcQs_kZoBA@mail.gmail.com/
> >>
> >> For sure, we do not want datagram sockets, RAW, netlink, and many othe=
rs.
> >
> > BTW vsock will probably fire lockdep warnings, I see GFP_KERNEL being u=
sed
> > in net/vmw_vsock/virtio_transport.c
> >
> > So you will have to fix this.
>
> Rather than play whack-a-mole with this, would it make sense to mark as
> socket as "writeback/reclaim" safe and base the nbd decision on that rath=
er
> than attempt to maintain some allow/deny list of sockets?

Even if a socket type was writeback/reclaim safe, probably NBD would not su=
pport
arbitrary socket type, like netlink, af_packet, or af_netrom.

An allow list seems safer to me, with commits with a clear owner.

If future syzbot reports are triggered, the bisection will point to
these commits.

