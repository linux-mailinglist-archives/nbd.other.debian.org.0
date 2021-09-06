Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69C40191F
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 11:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 209AB21375; Mon,  6 Sep 2021 09:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 09:45:11 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DF39F212F8
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 09:27:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 94DLQjAliCvm for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 09:27:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 33CAD212F1
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 09:27:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8E34767373; Mon,  6 Sep 2021 11:27:06 +0200 (CEST)
Date: Mon, 6 Sep 2021 11:27:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org, hch@lst.de
Subject: Re: [PATCH v2 1/3] nbd: use pr_err to output error message
Message-ID: <20210906092706.GA30790@lst.de>
References: <20210904122519.1963983-1-houtao1@huawei.com> <20210904122519.1963983-2-houtao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904122519.1963983-2-houtao1@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3srUJWjXGeO.A.iSC.nMeNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1389
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210906092706.GA30790@lst.de
Resent-Date: Mon,  6 Sep 2021 09:45:11 +0000 (UTC)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

