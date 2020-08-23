Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9A24EC6E
	for <lists+nbd@lfdr.de>; Sun, 23 Aug 2020 11:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ACA9C2054A; Sun, 23 Aug 2020 09:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug 23 09:27:09 2020
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7D8122052F
	for <lists-other-nbd@bendel.debian.org>; Sun, 23 Aug 2020 09:09:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id A4DpbpIrbfNo for <lists-other-nbd@bendel.debian.org>;
	Sun, 23 Aug 2020 09:09:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 20E59203F8
	for <nbd@other.debian.org>; Sun, 23 Aug 2020 09:09:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9836468AFE; Sun, 23 Aug 2020 11:09:15 +0200 (CEST)
Date: Sun, 23 Aug 2020 11:09:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?utf-8?B?55Sw?= <xianting_tian@126.com>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Subject: Re: [PATCH 2/2] block: fix locking for struct block_device size
 updates
Message-ID: <20200823090915.GA2764@lst.de>
References: <20200821085600.2395666-1-hch@lst.de> <20200821085600.2395666-3-hch@lst.de> <4df016bc-570c-d166-47dd-36a9f21fad13@suse.de> <133efc8b.1649.17410784734.Coremail.xianting_tian@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <133efc8b.1649.17410784734.Coremail.xianting_tian@126.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sQONv4gXJNI.A.DHE.tZjQfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/944
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200823090915.GA2764@lst.de
Resent-Date: Sun, 23 Aug 2020 09:27:09 +0000 (UTC)

On Fri, Aug 21, 2020 at 06:02:32PM +0800, 田 wrote:
> thanks Hellwig for your kindly reply and your fix and add report by me :)

I found an issue with the patch, and will send a new version in a bit.
If this works for your reproducer, can you add a Tested-by: tag?

