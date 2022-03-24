Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA54E67EC
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 18:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7E84F20354; Thu, 24 Mar 2022 17:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 17:39:09 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 44CDF202ED
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 17:23:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rF4791olU_iF for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 17:23:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 863F5202D6
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 17:23:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B63BF68C7B; Thu, 24 Mar 2022 18:23:35 +0100 (CET)
Date: Thu, 24 Mar 2022 18:23:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220324172335.GA28299@lst.de>
References: <20220324075119.1556334-1-hch@lst.de> <20220324075119.1556334-13-hch@lst.de> <20220324141321.pqesnshaswwk3svk@quack3.lan> <96a4e2e7-e16e-7e89-255d-8aa29ffca68b@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96a4e2e7-e16e-7e89-255d-8aa29ffca68b@I-love.SAKURA.ne.jp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yaEIBgjDnbE.A.DkH.9yKPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1778
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324172335.GA28299@lst.de
Resent-Date: Thu, 24 Mar 2022 17:39:09 +0000 (UTC)

On Thu, Mar 24, 2022 at 11:24:43PM +0900, Tetsuo Handa wrote:
> On 2022/03/24 23:13, Jan Kara wrote:
> >> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> >> index b3170e8cdbe95..e1eb925d3f855 100644
> >> --- a/drivers/block/loop.c
> >> +++ b/drivers/block/loop.c
> >> @@ -1244,7 +1244,7 @@ static int loop_clr_fd(struct loop_device *lo)
> >>  	 * <dev>/do something like mkfs/losetup -d <dev> causing the losetup -d
> >>  	 * command to fail with EBUSY.
> >>  	 */
> >> -	if (atomic_read(&lo->lo_refcnt) > 1) {
> >> +	if (disk_openers(lo->lo_disk) > 1) {
> 
> This is sometimes "if (0) {" due to not holding disk->open_mutex.

Yes, as clearly documented in the commit log.  In fact turning it
into an explicit if 0 (that is removing this code) might be a not
bad idea either - the code was added to work around a

	if (lo->lo_refcnt > 1)  /* we needed one fd for the ioctl */
		return -EBUSY;

that already did not make much sense to start with (but goes
back to before git history).

But for now I'd really prefer to stop moving the goalpost further and
further.

