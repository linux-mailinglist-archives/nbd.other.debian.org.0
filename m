Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23F4EAEA7
	for <lists+nbd@lfdr.de>; Tue, 29 Mar 2022 15:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 22D02210DA; Tue, 29 Mar 2022 13:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 29 13:42:10 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2EC8C211AD
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Mar 2022 13:25:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 82Z6T1g5jqZO for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Mar 2022 13:25:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9BBE120349
	for <nbd@other.debian.org>; Tue, 29 Mar 2022 13:25:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C293368AFE; Tue, 29 Mar 2022 15:25:02 +0200 (CEST)
Date: Tue, 29 Mar 2022 15:25:02 +0200
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
Message-ID: <20220329132502.GA2024@lst.de>
References: <20220325063929.1773899-1-hch@lst.de> <20220325063929.1773899-14-hch@lst.de> <03628e13-ca56-4ed0-da5a-ee698c83f48d@I-love.SAKURA.ne.jp> <20220329065234.GA20006@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329065234.GA20006@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <M5-emxogrBF.A.zbH.yywQiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1819
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220329132502.GA2024@lst.de
Resent-Date: Tue, 29 Mar 2022 13:42:10 +0000 (UTC)

Thinking a bit more, I really don't think the existing any refcount
check protects us against a different tread modififying the backing
file.  When a process has a file descriptor to a loop device open
and is multithreaded (or forks) we can still have multiple threads
manipulating the loop state.

That being said I do not think we really need that refcount check
at all - once loop_clr_fd set lo->lo_state to Lo_rundown under the
global lock we know that loop_validate_file will error out on it
due to the lo_state != Lo_bound check.

