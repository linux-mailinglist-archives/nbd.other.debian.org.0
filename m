Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B155104B
	for <lists+nbd@lfdr.de>; Mon, 20 Jun 2022 08:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D281120402; Mon, 20 Jun 2022 06:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 20 06:27:08 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 94EDA2039F
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Jun 2022 06:09:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nPMaacrKYHYm for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Jun 2022 06:09:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 72D342038D
	for <nbd@other.debian.org>; Mon, 20 Jun 2022 06:09:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7F18668B05; Mon, 20 Jun 2022 07:59:44 +0200 (CEST)
Date: Mon, 20 Jun 2022 07:59:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.garry@huawei.com>
Cc: axboe@kernel.dk, damien.lemoal@opensource.wdc.com, bvanassche@acm.org,
	hch@lst.de, jejb@linux.ibm.com, martin.petersen@oracle.com,
	hare@suse.de, satishkh@cisco.com, sebaddel@cisco.com,
	kartilak@cisco.com, linux-rdma@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	mpi3mr-linuxdrv.pdl@broadcom.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org
Subject: Re: [PATCH 4/5] scsi: fnic: Drop reserved request handling
Message-ID: <20220620055944.GC10192@lst.de>
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com> <1655463320-241202-5-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655463320-241202-5-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8lcCA0OJs4D.A.g8G.8MBsiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2160
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220620055944.GC10192@lst.de
Resent-Date: Mon, 20 Jun 2022 06:27:08 +0000 (UTC)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

