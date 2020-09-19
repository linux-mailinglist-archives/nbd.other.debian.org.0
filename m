Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB7270AE0
	for <lists+nbd@lfdr.de>; Sat, 19 Sep 2020 07:33:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C73972079B; Sat, 19 Sep 2020 05:33:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep 19 05:33:08 2020
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67C732077E
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Sep 2020 05:15:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 67F1rGPAiGqD for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Sep 2020 05:15:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 62CC520771
	for <nbd@other.debian.org>; Sat, 19 Sep 2020 05:15:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 811BE68BEB; Sat, 19 Sep 2020 07:15:20 +0200 (CEST)
Date: Sat, 19 Sep 2020 07:15:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	linux-ide@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 02/14] block: switch register_disk to use
 blkdev_get_by_dev
Message-ID: <20200919051520.GA7070@lst.de>
References: <20200917165720.3285256-1-hch@lst.de> <20200917165720.3285256-3-hch@lst.de> <091931b1-eb9c-e45e-c9e8-501554618508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <091931b1-eb9c-e45e-c9e8-501554618508@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pms-5NoKGKK.A.GCE.UgZZfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/984
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200919051520.GA7070@lst.de
Resent-Date: Sat, 19 Sep 2020 05:33:08 +0000 (UTC)

On Fri, Sep 18, 2020 at 11:52:39AM +0300, Sergei Shtylyov wrote:
> Hello!
>
> On 17.09.2020 19:57, Christoph Hellwig wrote:
>
>> Use blkdev_get_by_dev instead of open coding it using bdget_disk +
>> blkdev_get.
>
>    I don't see where you are removing bdget_disk() call (situated just before
> the below code?)...

Indeed.  That's what you get for a messy last minute rebase.. :(

