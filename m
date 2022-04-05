Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F414F237F
	for <lists+nbd@lfdr.de>; Tue,  5 Apr 2022 08:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6D876207CB; Tue,  5 Apr 2022 06:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr  5 06:45:10 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9F2B52074C
	for <lists-other-nbd@bendel.debian.org>; Tue,  5 Apr 2022 06:28:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8XPsHeIyCdew for <lists-other-nbd@bendel.debian.org>;
	Tue,  5 Apr 2022 06:28:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D686A2073E
	for <nbd@other.debian.org>; Tue,  5 Apr 2022 06:28:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E830C68AFE; Tue,  5 Apr 2022 08:28:38 +0200 (CEST)
Date: Tue, 5 Apr 2022 08:28:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: yet another approach to fix the loop lock order inversions v6
Message-ID: <20220405062838.GA24373@lst.de>
References: <20220330052917.2566582-1-hch@lst.de> <20220404074235.GA1046@lst.de> <499de381-c81e-4bd0-b5f7-1ee6be45821d@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <499de381-c81e-4bd0-b5f7-1ee6be45821d@I-love.SAKURA.ne.jp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RN1ptAAG1cF.A.zRB.2V-SiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1850
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220405062838.GA24373@lst.de
Resent-Date: Tue,  5 Apr 2022 06:45:10 +0000 (UTC)

On Mon, Apr 04, 2022 at 06:39:31PM +0900, Tetsuo Handa wrote:
> Two bugs which Jan has found in /bin/mount might not be yet fixed in
> versions developers/users are using. Thus, let's wait for a while
> before committing to linux.git.

Jan, which loop bugs might be relevant here?

