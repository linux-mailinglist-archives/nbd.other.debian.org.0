Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD72B0E7C
	for <lists+nbd@lfdr.de>; Thu, 12 Nov 2020 20:51:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E78792038C; Thu, 12 Nov 2020 19:51:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 12 19:51:08 2020
Old-Return-Path: <pvorel@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,LONGWORD,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B49E2202F1
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Nov 2020 19:33:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, LONGWORD=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
	RCVD_IN_MSPIKE_WL=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dmZMiBZVvayU for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Nov 2020 19:33:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 674 seconds by postgrey-1.36 at bendel; Thu, 12 Nov 2020 19:33:42 UTC
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp2.suse.de", Issuer "Let's Encrypt Authority X3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4E8CB2031E
	for <nbd@other.debian.org>; Thu, 12 Nov 2020 19:33:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C79EAFF8;
	Thu, 12 Nov 2020 19:22:25 +0000 (UTC)
Date: Thu, 12 Nov 2020 20:22:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-2?Q?Monn=E9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 05/24] block: remove the update_bdev parameter from
 set_capacity_revalidate_and_notify
Message-ID: <20201112192223.GA17194@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20201111082658.3401686-1-hch@lst.de>
 <20201111082658.3401686-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111082658.3401686-6-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gASBzuKDlCH.A.cCD.sIZrfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1065
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201112192223.GA17194@pevik
Resent-Date: Thu, 12 Nov 2020 19:51:08 +0000 (UTC)

Hi Christoph,

> The update_bdev argument is always set to true, so remove it.  Also
> rename the function to the slighly less verbose set_capacity_and_notify,
> as propagating the disk size to the block device isn't really
> revalidation.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Nice cleanup.

Kind regards,
Petr

