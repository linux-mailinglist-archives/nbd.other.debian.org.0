Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C24E67F7
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 18:42:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1905E20363; Thu, 24 Mar 2022 17:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 17:42:09 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 34C46202ED
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 17:24:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id duoihyclcroc for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 17:24:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id ACA6F202E2
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 17:24:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 66BAE68BFE; Thu, 24 Mar 2022 18:15:19 +0100 (CET)
Date: Thu, 24 Mar 2022 18:15:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220324171518.GC28007@lst.de>
References: <20220324075119.1556334-1-hch@lst.de> <20220324075119.1556334-13-hch@lst.de> <20220324141321.pqesnshaswwk3svk@quack3.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324141321.pqesnshaswwk3svk@quack3.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0jWzk3O6gYH.A.y1H.x1KPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1779
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324171518.GC28007@lst.de
Resent-Date: Thu, 24 Mar 2022 17:42:10 +0000 (UTC)

On Thu, Mar 24, 2022 at 03:13:21PM +0100, Jan Kara wrote:
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Looks good but I still think we need something like attached preparatory
> patch to not regress e.g. filesystem probing triggered by udev events. What
> do you think?

Yes, I think it makes sense to add that.

