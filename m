Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BBB50041
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 16:54:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE06B20593; Tue,  9 Sep 2025 14:54:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 14:54:11 2025
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
	by bendel.debian.org (Postfix) with ESMTP id 5786720566
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 14:36:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.581 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	USER_IN_DEF_DKIM_WL=-7.5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oF8PyAdV0l3C for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 14:36:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qk1-x729.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3F8832050E
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 14:36:03 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-81076e81aabso431798585a.3
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757428560; x=1758033360; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HraNQc0UftoQGnAHFz41MD+6PWIU9oXjn/T/bod79Lc=;
        b=lrk+Qd+PmEgY+/ZA5CRTv4/uRgldAVD9cwvyN28WAQG4PFbRra5+4MavR7Zfx8RIdZ
         R/DlFed1cPHSlQYoEnjjqtWvOA8aaXkPtW9i13ztsQrjBUBK5/TwdR3csryYneJsJh5E
         bA/6Ah1dLk48U1k+0dmO7AkEGl+jwWJY/fWzNPHiS1eOqmwtUdxlbC8sYO44eN0l7CEj
         x9u2NOBBUQc6r4OqI6QA37vfrdeiPD+XTPP3zGAPJE8HpzOYaxCwrBpyB1KIvRg2rlhO
         vKAWbVOT+60Daux3fXm5NZoysI4mQzAIocfqR1OTPrSdsJdwB+PArMlcrEYePbueu5wr
         NxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757428560; x=1758033360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HraNQc0UftoQGnAHFz41MD+6PWIU9oXjn/T/bod79Lc=;
        b=N0ROYA2sopJfRLedsYLgc3BjOD1BZdUum5AA4keiBTCRKnY/nbamBlN90kxkKrbNfE
         6zWwfjvEFd3U7rsXopyqlkUxMwJf0MC6c8PRn1f2jlOrpG01uTm2Cox7xP0j7pQMHdch
         yGcZ2MMdlw0T0VeRkxvk1SrZHEUG3XAgtBxGvme8H7WkVB3zs91G1b1l8s7v0RpVLwjJ
         77ydBDG91z/dbjnYehKXI5+nmipIaog7PGviqBzg64or4mz68uPZQYuSTxGJNeIJgmYS
         +JwQcrn2MclPQ+l4jLIM+Z0JBgO3ubv4MyGOplvCkiRVBet97wq7gNV3QgnrZxujspBg
         NkWg==
X-Forwarded-Encrypted: i=1; AJvYcCXIZ/Z4nsLdS4I2qDtT6uhqARIu0G1tpGYGxBHODM/QJJhqZq/sxAgVjTo8fclpiVA4U5Y=@other.debian.org
X-Gm-Message-State: AOJu0Yy/fcPpjH655W1NWk0HHivGSRko4dTjkAmFIc1A8vhuEMjp0LBd
	dnTZ9En9Dr+7XIQGd3OnfaxKpuHBkrsYatp6+nvD1JYhOLN58nSOF4gKHrzyuzAWmHZKuRbP2qL
	mCCXYC3F/2+SucwsT+tuo9yVYyMpKgRxIJdyWEL8t
X-Gm-Gg: ASbGnctEIwznV7UdsY1EWG7HPsbWAIxdocq/bpOLV951sCgMq6dZ14NvXGPHm1iYEYQ
	2kzKJuXrVBqmdnWGFv09YOfUgA+5j8bvxFlmlmVSHhhYNBUMXHaszgzrYRLatTFfAP58FC3RRL+
	RPWcI2dKg3oYALYJL1eVCRrPbCNFJ8v9G5q8hp+ABBNdn51X7nedlxOoLXeqpdnN9pwM9P6OjDw
	xbAwEeMthqkK5XWT17WH+rngOSNTms7bNXyOLKVAmgXEGYd22mQzrunpPU=
X-Google-Smtp-Source: AGHT+IEcQgssG3xpRvjhJBiKRjyFcvptOCwG39IVu/CLtP2NQ1mCQBIQWJNjR4pgnF/UmTo5naxxM4HNF2TQoVznEMI=
X-Received: by 2002:a05:620a:1724:b0:80a:865b:41c6 with SMTP id
 af79cd13be357-813c2f05abbmr1254106885a.71.1757428559921; Tue, 09 Sep 2025
 07:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250909132243.1327024-1-edumazet@google.com> <20250909132936.GA1460@redhat.com>
 <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
In-Reply-To: <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Sep 2025 07:35:48 -0700
X-Gm-Features: Ac12FXzzB88yrAkRmM86ZkLSUzK_othsjEAnd_7hIylswOuaxXv3xozERw8g82A
Message-ID: <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com>
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
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
Resent-Message-ID: <JK3tu7EyAp.A.JKED.T-DwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3435
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com
Resent-Date: Tue,  9 Sep 2025 14:54:11 +0000 (UTC)

On Tue, Sep 9, 2025 at 7:04=E2=80=AFAM Eric Dumazet <edumazet@google.com> w=
rote:
>
> On Tue, Sep 9, 2025 at 6:32=E2=80=AFAM Richard W.M. Jones <rjones@redhat.=
com> wrote:
> >
> > On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
> > > Recently, syzbot started to abuse NBD with all kinds of sockets.
> > >
> > > Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> > > made sure the socket supported a shutdown() method.
> > >
> > > Explicitely accept TCP and UNIX stream sockets.
> >
> > I'm not clear what the actual problem is, but I will say that libnbd &
> > nbdkit (which are another NBD client & server, interoperable with the
> > kernel) we support and use NBD over vsock[1].  And we could support
> > NBD over pretty much any stream socket (Infiniband?) [2].
> >
> > [1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
> >     https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
> > [2] https://libguestfs.org/nbd_connect_socket.3.html
> >
> > TCP and Unix domain sockets are by far the most widely used, but I
> > don't think it's fair to exclude other socket types.
>
> If we have known and supported socket types, please send a patch to add t=
hem.
>
> I asked the question last week and got nothing about vsock or other types=
.
>
> https://lore.kernel.org/netdev/CANn89iLNFHBMTF2Pb6hHERYpuih9eQZb6A12+ndzB=
cQs_kZoBA@mail.gmail.com/
>
> For sure, we do not want datagram sockets, RAW, netlink, and many others.

BTW vsock will probably fire lockdep warnings, I see GFP_KERNEL being used
in net/vmw_vsock/virtio_transport.c

So you will have to fix this.

