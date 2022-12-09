Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724C648686
	for <lists+nbd@lfdr.de>; Fri,  9 Dec 2022 17:33:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 795102033D; Fri,  9 Dec 2022 16:33:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  9 16:33:25 2022
Old-Return-Path: <kuba@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 294562025F
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Dec 2022 16:17:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.595 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IRShMwLlzSSL for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Dec 2022 16:17:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 342 seconds by postgrey-1.36 at bendel; Fri, 09 Dec 2022 16:17:18 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D805E20268
	for <nbd@other.debian.org>; Fri,  9 Dec 2022 16:17:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45F48B8289C;
	Fri,  9 Dec 2022 16:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20FEC433EF;
	Fri,  9 Dec 2022 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670602264;
	bh=OclmnU1jYcdMFqciE3c6RyUB6hgvanpdH2l220bFhz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lP5pQ24T3IT2YBfVVAYFE/vlA14kPUGpHI19DQSbfMFFqcLV6yfVQX2yzf3FWU9BJ
	 DEPOy15CleSzGVLHHvdVrCdctgS6AMOlWyxNMtd1UP4Jl6EFRe7WSmHsdwacu3KmIi
	 3gphHYn83fw+acEzH9vRCOj48wMtBY8ejFf/mJMd7kxsJCGH1dwZt2JHDO6M2WNy+F
	 RxYdcuexGpRtzv/r3df/M1OzYPk521V8CVwEXUXt0ZTCVSTYNw6OFG3RfFVHJS6f4s
	 Cy+bJUuWARFf6RP5DMfx0m0W7Y2ou/9vrV6yP2gJYTEe5AantjuQErI6+6QNzX5szc
	 v2qI3ygfSsAtw==
Date: Fri, 9 Dec 2022 08:11:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Christoph =?UTF-8?B?QsO2aG13?=
 =?UTF-8?B?YWxkZXI=?= <christoph.boehmwalder@linbit.com>, Jens Axboe
 <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, Lee Duncan <lduncan@suse.com>, Chris Leech
 <cleech@redhat.com>, Mike Christie <michael.christie@oracle.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Valentina Manea
 <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, David Howells
 <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Steve French
 <sfrench@samba.org>, Christine Caulfield <ccaulfie@redhat.com>, David
 Teigland <teigland@redhat.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker
 <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Eric Van
 Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Ilya Dryomov
 <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
 Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-nvme@lists.infradead.org,
 open-iscsi@googlegroups.com, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 cluster-devel@redhat.com, ocfs2-devel@oss.oracle.com,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org
Subject: Re: [PATCH v1 2/3] Treewide: Stop corrupting socket's task_frag
Message-ID: <20221209081101.7500478c@kernel.org>
In-Reply-To: <d220402a232e204676d9100d6fe4c2ae08f753ee.camel@redhat.com>
References: <cover.1669036433.git.bcodding@redhat.com>
	<c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<d220402a232e204676d9100d6fe4c2ae08f753ee.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2QZ6ZtKI-gD.A.eTG.VN2kjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2314
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221209081101.7500478c@kernel.org
Resent-Date: Fri,  9 Dec 2022 16:33:25 +0000 (UTC)

On Fri, 09 Dec 2022 13:37:08 +0100 Paolo Abeni wrote:
> I think this is the most feasible way out of the existing issue, and I
> think this patchset should go via the networking tree, targeting the
> Linux 6.2.

FWIW some fields had been moved so this will not longer apply cleanly,
see b534dc46c8ae016. But I think we can apply it to net since the merge
window is upon us? Just a heads up.

