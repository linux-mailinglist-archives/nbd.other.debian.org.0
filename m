Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7553BC586
	for <lists+nbd@lfdr.de>; Tue,  6 Jul 2021 06:33:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 329EF2041E; Tue,  6 Jul 2021 04:33:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  6 04:33:14 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DDD192040E
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Jul 2021 04:17:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KIQnLGywxprn for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Jul 2021 04:17:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 47FB920414
	for <nbd@other.debian.org>; Tue,  6 Jul 2021 04:17:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3A12B68BEB; Tue,  6 Jul 2021 06:17:19 +0200 (CEST)
Date: Tue, 6 Jul 2021 06:17:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guoqing Jiang <guoqing.jiang@linux.dev>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@lst.de,
	chaitanya.kulkarni@wdc.com, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH V2] nbd: fix order of cleaning up the queue and freeing
 the tagset
Message-ID: <20210706041718.GB11174@lst.de>
References: <1625477143-18716-1-git-send-email-wangqing@vivo.com> <20210706040016.1360412-1-guoqing.jiang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706040016.1360412-1-guoqing.jiang@linux.dev>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yf_SC22CtjH.A.FfH.K094gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1220
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210706041718.GB11174@lst.de
Resent-Date: Tue,  6 Jul 2021 04:33:14 +0000 (UTC)

On Tue, Jul 06, 2021 at 12:00:16PM +0800, Guoqing Jiang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> We must release the queue before freeing the tagset.
> 
> Fixes: 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and blk_cleanup_disk")
> Reported-and-tested-by: syzbot+9ca43ff47167c0ee3466@syzkaller.appspotmail.com
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> Signed-off-by: Guoqing Jiang <jiangguoqing@kylinos.cn>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

