Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A82824F23CE
	for <lists+nbd@lfdr.de>; Tue,  5 Apr 2022 08:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4FCF420784; Tue,  5 Apr 2022 06:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr  5 06:57:09 2022
Old-Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=4.0 tests=NICE_REPLY_A,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A0AA22077F
	for <lists-other-nbd@bendel.debian.org>; Tue,  5 Apr 2022 06:39:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.011 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, NICE_REPLY_A=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uBnWT-P4Wgjg for <lists-other-nbd@bendel.debian.org>;
	Tue,  5 Apr 2022 06:39:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 92C0E2077D
	for <nbd@other.debian.org>; Tue,  5 Apr 2022 06:39:10 +0000 (UTC)
Received: from fsav116.sakura.ne.jp (fsav116.sakura.ne.jp [27.133.134.243])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2356chwA054393;
	Tue, 5 Apr 2022 15:38:43 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav116.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp);
 Tue, 05 Apr 2022 15:38:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2356cgFx054383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 5 Apr 2022 15:38:42 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2e052daf-214d-6921-1765-3b4974cea7cc@I-love.SAKURA.ne.jp>
Date: Tue, 5 Apr 2022 15:38:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: yet another approach to fix the loop lock order inversions v6
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
        Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
        "Darrick J . Wong" <djwong@kernel.org>, Ming Lei <ming.lei@redhat.com>,
        Matteo Croce <mcroce@microsoft.com>, linux-block@vger.kernel.org,
        nbd@other.debian.org
References: <20220330052917.2566582-1-hch@lst.de>
 <20220404074235.GA1046@lst.de>
 <499de381-c81e-4bd0-b5f7-1ee6be45821d@I-love.SAKURA.ne.jp>
 <20220405062838.GA24373@lst.de>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20220405062838.GA24373@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2whRPIiOe8N.A.MS.Fh-SiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1851
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2e052daf-214d-6921-1765-3b4974cea7cc@I-love.SAKURA.ne.jp
Resent-Date: Tue,  5 Apr 2022 06:57:09 +0000 (UTC)

On 2022/04/05 15:28, Christoph Hellwig wrote:
> On Mon, Apr 04, 2022 at 06:39:31PM +0900, Tetsuo Handa wrote:
>> Two bugs which Jan has found in /bin/mount might not be yet fixed in
>> versions developers/users are using. Thus, let's wait for a while
>> before committing to linux.git.
> 
> Jan, which loop bugs might be relevant here?

Since async __loop_clr_fd() was reverted, these bugs should
no longer be relevant. But different bugs might be found with
this series. Thus, let's stay careful for a while...

