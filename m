Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E43B54854
	for <lists+nbd@lfdr.de>; Fri, 12 Sep 2025 11:51:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 46401207FC; Fri, 12 Sep 2025 09:51:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep 12 09:51:11 2025
Old-Return-Path: <horms@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E834020893
	for <lists-other-nbd@bendel.debian.org>; Fri, 12 Sep 2025 09:33:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.901 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BmJHWD383BtY for <lists-other-nbd@bendel.debian.org>;
	Fri, 12 Sep 2025 09:33:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 584 seconds by postgrey-1.36 at bendel; Fri, 12 Sep 2025 09:33:15 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 65ECE2085E
	for <nbd@other.debian.org>; Fri, 12 Sep 2025 09:33:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F2D1601E8;
	Fri, 12 Sep 2025 09:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189FEC4CEF1;
	Fri, 12 Sep 2025 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757669007;
	bh=C41iYMKm4+K4EFYPba7bEsrP/ut3g2gBXRLTNMIh0I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9EnDURdVKe3ZIPAxFRgqiKn5VY9IjvNjJ6km+9IJDaM534N9BrLJTsLpNn5/fsES
	 4Ik7r8FxqvxuNPsAGq4KflI7Pov0/6GspoWzfwLxqTWN2s4lRP/r51j+MSc0bUiqeL
	 bsdNPyjz9O7EJT5rxqP6ul+8r8gSVNrqJaND/aa05MjsIaS3BRZRqIUqUR5CuUBSE4
	 j2YuNzv1IlfFvgSSXhp4s9EJtzKiP0dZh2U+OfNqT6/NXVLDMzSV3CxogjxvaoTy76
	 zjJjLNweCmtWGiG3Yh9UKpX3vQckrrRXEAjdGjg7dOb8oU03/dywCsvuf60eJ7xvBQ
	 NguucfbJTfStw==
Date: Fri, 12 Sep 2025 10:23:22 +0100
From: Simon Horman <horms@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
	Mike Christie <mchristi@redhat.com>,
	Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
Message-ID: <20250912092322.GZ30363@horms.kernel.org>
References: <20250909132243.1327024-1-edumazet@google.com>
 <20250909132936.GA1460@redhat.com>
 <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
 <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com>
 <63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk>
 <CANn89iJiBuJ=sHbfKjR-bJe6p12UrJ_DkOgysmAQuwCbNEy8BA@mail.gmail.com>
 <20250909151851.GB1460@redhat.com>
 <CANn89i+-mODVnC=TjwoxVa-qBc4ucibbGoqfM9W7Uf9bryj9qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+-mODVnC=TjwoxVa-qBc4ucibbGoqfM9W7Uf9bryj9qQ@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JocS6s7WiKJ.A.0FKD.P0-woB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3442
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250912092322.GZ30363@horms.kernel.org
Resent-Date: Fri, 12 Sep 2025 09:51:11 +0000 (UTC)

On Tue, Sep 09, 2025 at 08:33:27AM -0700, Eric Dumazet wrote:
> On Tue, Sep 9, 2025 at 8:19 AM Richard W.M. Jones <rjones@redhat.com> wrote:
> > On Tue, Sep 09, 2025 at 07:47:09AM -0700, Eric Dumazet wrote:
> > > On Tue, Sep 9, 2025 at 7:37 AM Jens Axboe <axboe@kernel.dk> wrote:
> > > > On 9/9/25 8:35 AM, Eric Dumazet wrote:
> > > > > On Tue, Sep 9, 2025 at 7:04 AM Eric Dumazet <edumazet@google.com> wrote:
> > > > >> On Tue, Sep 9, 2025 at 6:32 AM Richard W.M. Jones <rjones@redhat.com> wrote:
> > > > >>> On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:

...

> > From the outside it seems really odd to hard code a list of "good"
> > socket types into each kernel client that can open a socket.  Normally
> > if you wanted to restrict socket types wouldn't you do that through
> > something more flexible like nftables?
> 
> nftables is user policy.
> 
> We need a kernel that will not crash, even if nftables is not
> compiled/loaded/used .

Hi Rich, Eric, all,

FWIIW, I think that the kernel maintaining a list of acceptable and
known to work socket types is a reasonable measure. It reduces the
surface where problems can arise - a surface that has real bugs.
And can be expanded as necessary.

For sure it is not perfect. There is a risk of entering wack-a-mole
territory. And a more flexible mechanism may be nice.

But, OTOH, we may be speculating about a problem that doesn't exist.
If, very occasionally, a new socket type comes along and has to be used.
Or perhaps more likely, there is a follow-up to this change for some
cases it missed (i.e. the topic of this thread). And if that is very
occasional. Is there really a problem?

The answer is of course subjective. But I lean towards no.

...

