Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EDCAFC0AF
	for <lists+nbd@lfdr.de>; Tue,  8 Jul 2025 04:15:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4420D2042B; Tue,  8 Jul 2025 02:15:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  8 02:15:15 2025
Old-Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B912E20551
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Jul 2025 01:59:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Pnat_0BjNagW for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Jul 2025 01:59:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 3987 seconds by postgrey-1.36 at bendel; Tue, 08 Jul 2025 01:59:03 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5432D20525
	for <nbd@other.debian.org>; Tue,  8 Jul 2025 01:59:02 +0000 (UTC)
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5680qJLw054763;
	Tue, 8 Jul 2025 09:52:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5680qJRE054758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 8 Jul 2025 09:52:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b8769d22-fa19-4374-bbcc-be3f06f420bf@I-love.SAKURA.ne.jp>
Date: Tue, 8 Jul 2025 09:52:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
To: Hillf Danton <hdanton@sina.com>, Bart Van Assche <bvanassche@acm.org>
Cc: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
        syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>,
        Ming Lei <ming.lei@redhat.com>, linux-kernel@vger.kernel.org,
        nbd@other.debian.org, syzkaller-bugs@googlegroups.com
References: <20250707005946.2669-1-hdanton@sina.com>
 <20250708001848.2775-1-hdanton@sina.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250708001848.2775-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav105.rs.sakura.ne.jp
X-Virus-Status: clean
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JfgbUmzjL5O.A.gNXF.z8HboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3411
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b8769d22-fa19-4374-bbcc-be3f06f420bf@I-love.SAKURA.ne.jp
Resent-Date: Tue,  8 Jul 2025 02:15:15 +0000 (UTC)

On 2025/07/08 9:18, Hillf Danton wrote:
> On Mon, 7 Jul 2025 10:39:44 -0700 Bart Van Assche wrote:
>> On 7/6/25 5:59 PM, Hillf Danton wrote:
>>> and given the second one, the report is false positive.
>>
>> Whether or not this report is a false positive, the root cause should be
>> fixed because lockdep disables itself after the first circular locking
>> complaint. From print_usage_bug() in kernel/locking/lockdep.c:
>>
>> 	if (!debug_locks_off() || debug_locks_silent)
>> 		return;
>>
> The root cause could be walked around for example by trying not to init
> nbd more than once.

How did you come to think so?

nbd_init() is already called only once because of module_init(nbd_init).

