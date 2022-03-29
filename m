Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5C4EA853
	for <lists+nbd@lfdr.de>; Tue, 29 Mar 2022 09:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9D3B121041; Tue, 29 Mar 2022 07:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 29 07:09:09 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ED16320ED3
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Mar 2022 06:52:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2opKnVTvIoUy for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Mar 2022 06:52:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0C8E420EB6
	for <nbd@other.debian.org>; Tue, 29 Mar 2022 06:52:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5D8F668AFE; Tue, 29 Mar 2022 08:52:34 +0200 (CEST)
Date: Tue, 29 Mar 2022 08:52:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: [PATCH 13/14] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220329065234.GA20006@lst.de>
References: <20220325063929.1773899-1-hch@lst.de> <20220325063929.1773899-14-hch@lst.de> <03628e13-ca56-4ed0-da5a-ee698c83f48d@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03628e13-ca56-4ed0-da5a-ee698c83f48d@I-love.SAKURA.ne.jp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TR7V_OPF-O.A.KjC.VCrQiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1816
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220329065234.GA20006@lst.de
Resent-Date: Tue, 29 Mar 2022 07:09:09 +0000 (UTC)

Hi Tetsuo,

I'm a bit confused. Partially due to the two patches in one mail, but
also because I can't actually find a try that they cleanly apply to.

But let me add my thoughts here:

 - I think the change 

On Sat, Mar 26, 2022 at 11:52:36AM +0900, Tetsuo Handa wrote:
> Since __loop_clr_fd() is currently holding loop_validate_mutex and lo->lo_mutex,
> "avoid lo_mutex in ->release" part is incomplete.
> 
> The intent of holding loop_validate_mutex (which causes disk->open_mutex =>
> loop_validate_mutex => lo->lo_mutex => blk_mq_freeze_queue()/blk_mq_unfreeze_queue()
> chain) is to make loop_validate_file() traversal safe.
> 
> Since ->release is called with disk->open_mutex held, and __loop_clr_fd() from
> lo_release() is called via ->release when disk_openers() == 0, we are guaranteed
> that "struct file" which will be passed to loop_validate_file() via fget() cannot
> be the loop device __loop_clr_fd(lo, true) will clear. Thus, there is no need to
> hold loop_validate_mutex and lo->lo_mutex from __loop_clr_fd() if release == true.

This part looks reasonable.  Can you give a signoff and proper commit
log and I'll slot it in before the lo_refcount removal.

