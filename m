Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A43D8795
	for <lists+nbd@lfdr.de>; Wed, 28 Jul 2021 07:57:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 65B28206F6; Wed, 28 Jul 2021 05:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 28 05:57:09 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E405920665
	for <lists-other-nbd@bendel.debian.org>; Wed, 28 Jul 2021 05:39:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q9u3C2vAIj0Y for <lists-other-nbd@bendel.debian.org>;
	Wed, 28 Jul 2021 05:39:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 50F232067A
	for <nbd@other.debian.org>; Wed, 28 Jul 2021 05:39:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B9F1067357; Wed, 28 Jul 2021 07:39:15 +0200 (CEST)
Date: Wed, 28 Jul 2021 07:39:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] nbd: do del_gendisk() asynchronously
Message-ID: <20210728053915.GA3374@lst.de>
References: <20210728044211.115787-1-houtao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728044211.115787-1-houtao1@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mubLarlpHjM.A.g2.1GPAhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1227
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210728053915.GA3374@lst.de
Resent-Date: Wed, 28 Jul 2021 05:57:09 +0000 (UTC)

Thanks,

this looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

