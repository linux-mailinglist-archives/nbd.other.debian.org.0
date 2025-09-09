Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F62B501E8
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 17:51:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 161CB20571; Tue,  9 Sep 2025 15:51:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 15:51:23 2025
Old-Return-Path: <edumazet@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_NONE,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EDC6B205AD
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 15:33:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.581 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_MED=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hNsWRdTJglmW for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 15:33:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x833.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9BD56205AB
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 15:33:42 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4b109c6b9fcso46035891cf.3
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757432019; x=1758036819; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH53MCx6ogN1k+/cTYDbkLwp7+QCPYAr+PyETboPxPU=;
        b=b76j2SL3Gr2AAGz//0tWs2rg1hgmhhboTF4WP0u2uu1LrIkUBAL/PmEWZ50wwU1uJ2
         UwMInmjhBPZemAHZ+0B4GvfXNBUfSQr/V30xWHI+9OcpNs2DdMHftUSbiNyIwKiwqHN4
         BRa1e+9Md9T/z7SO/nQcL18LdYrwmPmC7CrpQb9nJgMIn8HuPDjO7j59qyIvqGwyEyM2
         4/FsDoUSk/Ri6GgbwIYtslrIkfgHJfGjb9mXPFIZEFp4pvW0o+xPs2mZA+C9CiM7p7AC
         PkZIwu0TvL5uK2baRrD1leT99EIIcxmArjVWmL6tV1WlRV4tFvGwDl00CMn9wEX4KkgB
         OyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432019; x=1758036819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LH53MCx6ogN1k+/cTYDbkLwp7+QCPYAr+PyETboPxPU=;
        b=HKFKnOIrn7ecK9oeLN/uICjFFBy7wkqljOm3DK/NeWxx2NNnOO+PI2iGmbtv2H6G4N
         wAaE/Y4+xnHAdg7o0JrlF7pBpgjbwZX3xSgh4w1g2xBLjOl7LSDwzifumC6IOwuYFFhW
         9qVlXNGNGVBmvYhxkh2w6BB1S1CNkMtlydKap/vCu3hKMKROavCr/PuIEGqdYMjJW5Od
         gOYH8TIDiRzOJ2okUyxRQc/Cew8kCQA6ZokB7uJ+fbC4tTXpbUiDK6rwo4guSb3oIBDr
         YAD0f4xVIi9nFeBKmw8Ar9AJAltfUz3TJAtTXPi7wWwiprSvzOoLj39ahsaeU1QsAik9
         HBAA==
X-Forwarded-Encrypted: i=1; AJvYcCUPkOmkUSoOQoY7Wb/9+ftojJGaucxOQU4JbFjw8myquqtzCiJxCFaBW5xjjKdHu5J7mFo=@other.debian.org
X-Gm-Message-State: AOJu0Ywf3S97wGT1qdwIlJ9d9czyghpA++kkK8vYD3v3caxF6HOg4oph
	h60LjgGge3bN4Bq2HgbCJmNPET46o1dpWYYwFqQnj+1tGTWWJjV0ciXMXsHVpLlbkXHSF7mz6IP
	Vo+geg0L6nlu201u/M/YYDYQyQx0VrkeGowijeIn2
X-Gm-Gg: ASbGncs5FvAGQCY9gn9WfdK3pI1H8PQnGS21YiFK5oERuwId+o7Kz4h7C29wiajwn5g
	pp9sEWT2FhYpE8RMa1asMUGi13q/nQYiLWzrpBRLRIB+joiFPailU/uG+QgL4GFjocqaIkCCgWj
	jMFE//H3qsCoZdEobsd3AK6pB5SHiqawqSjEG2pdVbQVZWdE8Dxm+3xN+JS/pYHNXfLLrcTi8W6
	KWGvpVoA3YMth3ugalqSniGeoeZixREKhH/6WKutfF9WRSu521/BVjMAoY=
X-Google-Smtp-Source: AGHT+IEBSJFGC5HE816C89rHJ7brsZIZ78JEBVc19MhZewWuyBdDU+KpX7j08rvkOLFoUtfGNDkZcsKLsSZemorc0Ok=
X-Received: by 2002:a05:622a:1887:b0:4b5:ea94:d715 with SMTP id
 d75a77b69052e-4b5f8390522mr114936061cf.1.1757432018215; Tue, 09 Sep 2025
 08:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250909132243.1327024-1-edumazet@google.com> <20250909132936.GA1460@redhat.com>
 <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
 <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com>
 <63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk> <CANn89iJiBuJ=sHbfKjR-bJe6p12UrJ_DkOgysmAQuwCbNEy8BA@mail.gmail.com>
 <20250909151851.GB1460@redhat.com>
In-Reply-To: <20250909151851.GB1460@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Sep 2025 08:33:27 -0700
X-Gm-Features: Ac12FXwmsBi8N5rZnVovo52dil5DJvY7h1QqJGILCkzQ81ibk4sKlJtshywQWDc
Message-ID: <CANn89i+-mODVnC=TjwoxVa-qBc4ucibbGoqfM9W7Uf9bryj9qQ@mail.gmail.com>
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Eric Dumazet <eric.dumazet@gmail.com>, 
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com, 
	Mike Christie <mchristi@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AaTeyALv57D.A.k8ZD.7zEwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3440
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89i+-mODVnC=TjwoxVa-qBc4ucibbGoqfM9W7Uf9bryj9qQ@mail.gmail.com
Resent-Date: Tue,  9 Sep 2025 15:51:23 +0000 (UTC)

On Tue, Sep 9, 2025 at 8:19=E2=80=AFAM Richard W.M. Jones <rjones@redhat.co=
m> wrote:
>
> On Tue, Sep 09, 2025 at 07:47:09AM -0700, Eric Dumazet wrote:
> > On Tue, Sep 9, 2025 at 7:37=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wro=
te:
> > >
> > > On 9/9/25 8:35 AM, Eric Dumazet wrote:
> > > > On Tue, Sep 9, 2025 at 7:04=E2=80=AFAM Eric Dumazet <edumazet@googl=
e.com> wrote:
> > > >>
> > > >> On Tue, Sep 9, 2025 at 6:32=E2=80=AFAM Richard W.M. Jones <rjones@=
redhat.com> wrote:
> > > >>>
> > > >>> On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
> > > >>>> Recently, syzbot started to abuse NBD with all kinds of sockets.
> > > >>>>
> > > >>>> Commit cf1b2326b734 ("nbd: verify socket is supported during set=
up")
> > > >>>> made sure the socket supported a shutdown() method.
> > > >>>>
> > > >>>> Explicitely accept TCP and UNIX stream sockets.
> > > >>>
> > > >>> I'm not clear what the actual problem is, but I will say that lib=
nbd &
> > > >>> nbdkit (which are another NBD client & server, interoperable with=
 the
> > > >>> kernel) we support and use NBD over vsock[1].  And we could suppo=
rt
> > > >>> NBD over pretty much any stream socket (Infiniband?) [2].
> > > >>>
> > > >>> [1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
> > > >>>     https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
> > > >>> [2] https://libguestfs.org/nbd_connect_socket.3.html
> > > >>>
> > > >>> TCP and Unix domain sockets are by far the most widely used, but =
I
> > > >>> don't think it's fair to exclude other socket types.
> > > >>
> > > >> If we have known and supported socket types, please send a patch t=
o add them.
> > > >>
> > > >> I asked the question last week and got nothing about vsock or othe=
r types.
> > > >>
> > > >> https://lore.kernel.org/netdev/CANn89iLNFHBMTF2Pb6hHERYpuih9eQZb6A=
12+ndzBcQs_kZoBA@mail.gmail.com/
> > > >>
> > > >> For sure, we do not want datagram sockets, RAW, netlink, and many =
others.
> > > >
> > > > BTW vsock will probably fire lockdep warnings, I see GFP_KERNEL
> > > > being used in net/vmw_vsock/virtio_transport.c
>
> CC-ing Stefan & Stefano.  Myself, I'm only using libnbd
> (ie. userspace) over vsock, not the kernel client.
>
> > > > So you will have to fix this.
> > >
> > > Rather than play whack-a-mole with this, would it make sense to mark =
as
> > > socket as "writeback/reclaim" safe and base the nbd decision on that =
rather
> > > than attempt to maintain some allow/deny list of sockets?
> >
> > Even if a socket type was writeback/reclaim safe, probably NBD would no=
t support
> > arbitrary socket type, like netlink, af_packet, or af_netrom.
> >
> > An allow list seems safer to me, with commits with a clear owner.
> >
> > If future syzbot reports are triggered, the bisection will point to
> > these commits.
>
> From the outside it seems really odd to hard code a list of "good"
> socket types into each kernel client that can open a socket.  Normally
> if you wanted to restrict socket types wouldn't you do that through
> something more flexible like nftables?

nftables is user policy.

We need a kernel that will not crash, even if nftables is not
compiled/loaded/used .


>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rj=
ones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
>

