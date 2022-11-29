Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453863C708
	for <lists+nbd@lfdr.de>; Tue, 29 Nov 2022 19:09:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3570321372; Tue, 29 Nov 2022 18:09:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 29 18:09:12 2022
Old-Return-Path: <jlayton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,SARE_MSGID_LONG40 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B4B712134B
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Nov 2022 17:51:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.958 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5, SARE_MSGID_LONG40=0.637]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O_74oQMdE9ZD for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Nov 2022 17:51:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 500 seconds by postgrey-1.36 at bendel; Tue, 29 Nov 2022 17:51:06 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B2CF82134D
	for <nbd@other.debian.org>; Tue, 29 Nov 2022 17:51:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1BB80CE13C9;
	Tue, 29 Nov 2022 17:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D66C433C1;
	Tue, 29 Nov 2022 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669743759;
	bh=3+jgbqIH2MJTIsVHlcxt6FoqC9JTTWJi5HGZCaZxgug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QUm6mA5J8FMakXMYs9TxR1saaYz2xtuB1WQ4vJJERTQPls5BaIPHVnOKz8jZIo9kT
	 XulObDx1A347icJCI3BmL1Pf+V0Y6vDE7c7GJVgCQGxPvlvdctmnzKGaymxCYNMyXQ
	 dKw/DfIH615h0CSbluMrGHtANR4WOUzVKajaI/Lk7UG43sRTDV3681zTOgmNB5PA42
	 4z8cYl3L4lhD0Mvd0OcboC2hB3hl3nwz3MNA3jwsaSJnlHZe8k2mACwlMT6PMRhQUD
	 9V/1JVeknQRJ/G2/votnmVuu78OlhM7g7yW8UlJERa2tg+7VQlKisF3sYHT8GaId68
	 G+E9LkyPR/ygQ==
Message-ID: <d0a8f7a5e307e201926ae8e80d629da10c706a91.camel@kernel.org>
Subject: Re: [PATCH v1 2/3] Treewide: Stop corrupting socket's task_frag
From: Jeff Layton <jlayton@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Benjamin Coddington <bcodding@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Reisner
 <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
 Christoph =?ISO-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Keith
 Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Lee Duncan
 <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,  Mike Christie
 <michael.christie@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Valentina Manea
 <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, David Howells
 <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Steve French
 <sfrench@samba.org>, Christine Caulfield <ccaulfie@redhat.com>, David
 Teigland <teigland@redhat.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker
 <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Eric Van
 Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
 Lever <chuck.lever@oracle.com>, drbd-dev@lists.linbit.com, 
 linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-nvme@lists.infradead.org, open-iscsi@googlegroups.com, 
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, cluster-devel@redhat.com, 
 ocfs2-devel@oss.oracle.com, v9fs-developer@lists.sourceforge.net, 
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org
Date: Tue, 29 Nov 2022 12:42:33 -0500
In-Reply-To: <20221129140242.GA15747@lst.de>
References: <cover.1669036433.git.bcodding@redhat.com>
	 <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	 <20221129140242.GA15747@lst.de>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ybl_E04qsQJ.A.MFF.IrkhjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2310
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d0a8f7a5e307e201926ae8e80d629da10c706a91.camel@kernel.org
Resent-Date: Tue, 29 Nov 2022 18:09:12 +0000 (UTC)

On Tue, 2022-11-29 at 15:02 +0100, Christoph Hellwig wrote:
> Hmm.  Having to set a flag to not accidentally corrupt per-task
> state seems a bit fragile.  Wouldn't it make sense to find a way to opt
> into the feature only for sockets created from the syscall layer?

I agree that that would be cleaner. task_frag should have been an opt-in
thing all along. That change regressed all of the in-kernel users of
sockets.

Where would be the right place to set that flag for only userland
sockets? A lot of the in-kernel socket users hook into the socket API at
a fairly high-level. 9P and CIFS, for instance, call __sock_create.

We could set it in the syscall handlers (and maybe in iouring) I
suppose, but that seems like the wrong thing to do too.

In the absence of a clean place to do this, I think we're going to be
stuck doing it the way Ben has proposed...
--=20
Jeff Layton <jlayton@kernel.org>

