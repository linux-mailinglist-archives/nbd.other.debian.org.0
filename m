Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C6B4FF2F
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 16:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04C9D20566; Tue,  9 Sep 2025 14:21:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 14:21:10 2025
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
	by bendel.debian.org (Postfix) with ESMTP id 8338A205AB
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 14:05:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.581 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	USER_IN_DEF_DKIM_WL=-7.5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7RtHjRvg84Iz for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 14:05:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x82f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 60F9720591
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 14:05:02 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b5ed9d7e96so39066551cf.0
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757426699; x=1758031499; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe3MS4NWrw5pSnT/UHkzhsJzbgIdx98+KXeSp06EODM=;
        b=mTPJ+9nz3J2yBTwmDtPBfy/bY+gt0HyRQo3E7arKDGp4MJBCZrfo+U876ZqVeP9jwV
         iHTN5FXcvkBLoR6Vd6ujyAQprYbTq9Krp9sl0aEpCwtYzAzW0T0KD5sC/QVCEAc9drug
         hIu5kpmNap9P5B+kDOexjmkaHUY6229vcfu+rVktlvJxIQA0pj6X35xJdkQYVebCymtn
         Tga7tJ1oP/o5VUUQCxHqxrkAxbEryBPk7S9MmkEufuMewvmdLWFQ0czlFR1m7s7kkw3k
         B523fPm3H7pd75IMH0tKqNXDo28X8Bb820Se2hSzUGiG12AUr1rJuyahAhIODoGj+qva
         qQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426699; x=1758031499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe3MS4NWrw5pSnT/UHkzhsJzbgIdx98+KXeSp06EODM=;
        b=uTK5Z1MT3LDcLV15ixjvdXBnCeVZsQstOF+f345zkclhbW/nWvfy+7NFytQkXtjH1y
         2AYErUhfCGFFQi5c7/t+hHrIfbnFIzC0usNehPB+DzzEYO6qgxSWZg6GqTFWJJ6JdX1T
         etZdxDcu7THhqVj/85U9xKrVqlF5WH0bVIO+Cc6osadJpxpNiL5fGgKlfKsImjcOzJr4
         PWkp6vg21MqPPy1MSxpgs+SLvGi4xMBMrXZhphZyDY1Hp60HLCo7ne4T0A3/s0MqG3dD
         XOWY6qSt5/18uY2PvUY00mU2SXicy9jU8DbIgOeEH6N7KVtWIrjkgEP+nBD13agsvrZm
         4VYg==
X-Forwarded-Encrypted: i=1; AJvYcCX0FjhxSPg9slxlD34K6FCC+vbTsRuKa/lo/e8RwUNIljVBwvRgF7U+B+4hNxBmIlIATlQ=@other.debian.org
X-Gm-Message-State: AOJu0YwSECMAiko9UtsxGKC7SUc/HPY2BXi1qn2Dk0zvsaQhh52ADZAp
	+xIXQol+qrJRc5+TEF0yc3ucQeE4pzrPYlkXM790hWsBmOEeYdY+4Fz9b9rsCuxFa3akH5QpuPh
	SoTEp9xaJMY1JSJ8VZvwSgk6CeZbg4vZIJCiWD6c+
X-Gm-Gg: ASbGncu2kynVIUK+0lWl+4M0Rrdm49Gt9d5Hfydg7JufDln2cK+cKmJKLkX9/WS3qya
	wu3ncr+RarXg/DwsfMfxoaMfCe89nev7mXMIiRDKFdMSnY8ATcorBrlxVsj4s4POFeRvJpRc45H
	CzUhrJgnBmNU+w9BrdKF6gR7qsHB04hp5RIrvsncjTwfmGD6lmFQI2vG9TODikrSCFdw2z08HzJ
	h2JKmBu1gXwV7F0TklDdfuFI9z9hz8cu8wA/Yh66FGjzUUg
X-Google-Smtp-Source: AGHT+IEEJs5ATIhb/+q+aJw0Fa+x8WJDtjNWkOr2z/Gq3RIHYs/0Zof9ATeSU5qk43EzE1eKqSxCu5/hSladqbzUtB8=
X-Received: by 2002:a05:622a:1:b0:4b3:4e8e:9e32 with SMTP id
 d75a77b69052e-4b5f8382644mr139813601cf.3.1757426696511; Tue, 09 Sep 2025
 07:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250909132243.1327024-1-edumazet@google.com> <20250909132936.GA1460@redhat.com>
In-Reply-To: <20250909132936.GA1460@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Sep 2025 07:04:45 -0700
X-Gm-Features: Ac12FXyw6AFwM8QYIvqrqv7UIhW5n9GY5UElWWm_-QForGN8qFcrvQqZyLC1MGI
Message-ID: <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
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
Resent-Message-ID: <J2NqaNuUeXI.A.kr4C.WfDwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3434
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com
Resent-Date: Tue,  9 Sep 2025 14:21:11 +0000 (UTC)

On Tue, Sep 9, 2025 at 6:32=E2=80=AFAM Richard W.M. Jones <rjones@redhat.co=
m> wrote:
>
> On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
> > Recently, syzbot started to abuse NBD with all kinds of sockets.
> >
> > Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> > made sure the socket supported a shutdown() method.
> >
> > Explicitely accept TCP and UNIX stream sockets.
>
> I'm not clear what the actual problem is, but I will say that libnbd &
> nbdkit (which are another NBD client & server, interoperable with the
> kernel) we support and use NBD over vsock[1].  And we could support
> NBD over pretty much any stream socket (Infiniband?) [2].
>
> [1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
>     https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
> [2] https://libguestfs.org/nbd_connect_socket.3.html
>
> TCP and Unix domain sockets are by far the most widely used, but I
> don't think it's fair to exclude other socket types.

If we have known and supported socket types, please send a patch to add the=
m.

I asked the question last week and got nothing about vsock or other types.

https://lore.kernel.org/netdev/CANn89iLNFHBMTF2Pb6hHERYpuih9eQZb6A12+ndzBcQ=
s_kZoBA@mail.gmail.com/

For sure, we do not want datagram sockets, RAW, netlink, and many others.

