Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB633F7226
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 11:45:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 885812077A; Wed, 25 Aug 2021 09:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 09:45:10 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=none autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 71A4620597
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 09:27:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Uwm4FU0Hupml for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 09:27:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3081B20592
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 09:27:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 85C3B67357; Wed, 25 Aug 2021 11:27:31 +0200 (CEST)
Date: Wed, 25 Aug 2021 11:27:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hillf Danton <hdanton@sina.com>
Cc: syzbot <syzbot+2c98885bcd769f56b6d6@syzkaller.appspotmail.com>,
	axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: use-after-free Read in nbd_genl_connect (2)
Message-ID: <20210825092731.GA1328@lst.de>
References: <0000000000007900bd05ca5cf80b@google.com> <20210825085525.2147-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825085525.2147-1-hdanton@sina.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y7x0zqkqzOM.A.svG.mEhJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1326
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825092731.GA1328@lst.de
Resent-Date: Wed, 25 Aug 2021 09:45:10 +0000 (UTC)

On Wed, Aug 25, 2021 at 04:55:25PM +0800, Hillf Danton wrote:
> Because no nbd is kfreed without being removed from the nbd idr, finding
> a freed nbd in the idr with nbd_index_mutex held means the nbd is not a
> valid pointer, and fix the uaf by cutting the chance for invalid nbd.
> 
> Only for thoughts now.

That is a bug, but not really the problem here.  I think the issue
is the completion issue that Tetsuo reported.  Looking into that at
the moment.

