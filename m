Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773342EC75
	for <lists+nbd@lfdr.de>; Fri, 15 Oct 2021 10:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E17E5204A9; Fri, 15 Oct 2021 08:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 15 08:36:09 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 21FA120489
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 Oct 2021 08:20:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.762 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qv7BfF8rgcB7 for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 Oct 2021 08:19:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga03-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9C4FB20488
	for <nbd@other.debian.org>; Fri, 15 Oct 2021 08:19:53 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HVzgM32rvz8tY1;
	Fri, 15 Oct 2021 16:18:39 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 15 Oct 2021 16:19:48 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 15 Oct 2021 16:19:47 +0800
Subject: Re: [patch v8 0/7] handle unexpected message from server
From: "yukuai (C)" <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>,
	<hch@infradead.org>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
 <f56cc608-ac55-0eee-f3d0-19ba1a8c22ef@huawei.com>
 <37b222c1-d6b0-3e46-248a-2557db40ae92@huawei.com>
 <5effbc3a-e2f5-063f-6a20-985016d390c6@huawei.com>
Message-ID: <326edfba-01d3-9921-de9a-24134c592012@huawei.com>
Date: Fri, 15 Oct 2021 16:19:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5effbc3a-e2f5-063f-6a20-985016d390c6@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gu9LFiUpmtE.A.CbG.51TahB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1539
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/326edfba-01d3-9921-de9a-24134c592012@huawei.com
Resent-Date: Fri, 15 Oct 2021 08:36:09 +0000 (UTC)

On 2021/10/08 15:17, yukuai (C) wrote:
> On 2021/09/29 20:54, yukuai (C) wrote:
>> On 2021/09/23 21:33, yukuai (C) wrote:
>>> On 2021/09/16 17:33, Yu Kuai wrote:
>>>
>>> Hi, jens
>>>
>>> Any interest to apply this series?
>>
>> friendly ping ...
> 
> Hi, Jens
> 
> friendly ping again ...

Hi, Jens

friendly ping again ...
>>>
>>> Thanks,
>>> Kuai
>>>> This patch set tries to fix that client might oops if nbd server send
>>>> unexpected message to client, for example, our syzkaller report a uaf
>>>> in nbd_read_stat():
>>>>
>>>> Call trace:
>>>>   dump_backtrace+0x0/0x310 arch/arm64/kernel/time.c:78
>>>>   show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
>>>>   __dump_stack lib/dump_stack.c:77 [inline]
>>>>   dump_stack+0x144/0x1b4 lib/dump_stack.c:118
>>>>   print_address_description+0x68/0x2d0 mm/kasan/report.c:253
>>>>   kasan_report_error mm/kasan/report.c:351 [inline]
>>>>   kasan_report+0x134/0x2f0 mm/kasan/report.c:409
>>>>   check_memory_region_inline mm/kasan/kasan.c:260 [inline]
>>>>   __asan_load4+0x88/0xb0 mm/kasan/kasan.c:699
>>>>   __read_once_size include/linux/compiler.h:193 [inline]
>>>>   blk_mq_rq_state block/blk-mq.h:106 [inline]
>>>>   blk_mq_request_started+0x24/0x40 block/blk-mq.c:644
>>>>   nbd_read_stat drivers/block/nbd.c:670 [inline]
>>>>   recv_work+0x1bc/0x890 drivers/block/nbd.c:749
>>>>   process_one_work+0x3ec/0x9e0 kernel/workqueue.c:2147
>>>>   worker_thread+0x80/0x9d0 kernel/workqueue.c:2302
>>>>   kthread+0x1d8/0x1e0 kernel/kthread.c:255
>>>>   ret_from_fork+0x10/0x18 arch/arm64/kernel/entry.S:1174
>>>>
>>>> 1) At first, a normal io is submitted and completed with scheduler:
>>>>
>>>> internel_tag = blk_mq_get_tag -> get tag from sched_tags
>>>>   blk_mq_rq_ctx_init
>>>>    sched_tags->rq[internel_tag] = sched_tag->static_rq[internel_tag]
>>>> ...
>>>> blk_mq_get_driver_tag
>>>>   __blk_mq_get_driver_tag -> get tag from tags
>>>>   tags->rq[tag] = sched_tag->static_rq[internel_tag]
>>>>
>>>> So, both tags->rq[tag] and sched_tags->rq[internel_tag] are pointing
>>>> to the request: sched_tags->static_rq[internal_tag]. Even if the
>>>> io is finished.
>>>>
>>>> 2) nbd server send a reply with random tag directly:
>>>>
>>>> recv_work
>>>>   nbd_read_stat
>>>>    blk_mq_tag_to_rq(tags, tag)
>>>>     rq = tags->rq[tag]
>>>>
>>>> 3) if the sched_tags->static_rq is freed:
>>>>
>>>> blk_mq_sched_free_requests
>>>>   blk_mq_free_rqs(q->tag_set, hctx->sched_tags, i)
>>>>    -> step 2) access rq before clearing rq mapping
>>>>    blk_mq_clear_rq_mapping(set, tags, hctx_idx);
>>>>    __free_pages() -> rq is freed here
>>>>
>>>> 4) Then, nbd continue to use the freed request in nbd_read_stat()
>>>>
>>>> Changes in v8:
>>>>   - add patch 5 to this series.
>>>>   - modify some words.
>>>> Changes in v7:
>>>>   - instead of exposing blk_queue_exit(), using percpu_ref_put()
>>>>   directly.
>>>>   - drop the ref right after nbd_handle_reply().
>>>> Changes in v6:
>>>>   - don't set cmd->status to error if request is completed before
>>>>   nbd_clear_req().
>>>>   - get 'q_usage_counter' to prevent accessing freed request through
>>>>   blk_mq_tag_to_rq(), instead of using blk_mq_find_and_get_req().
>>>> Changes in v5:
>>>>   - move patch 1 & 2 in v4 (patch 4 & 5 in v5) behind
>>>>   - add some comment in patch 5
>>>> Changes in v4:
>>>>   - change the name of the patchset, since uaf is not the only problem
>>>>   if server send unexpected reply message.
>>>>   - instead of adding new interface, use blk_mq_find_and_get_req().
>>>>   - add patch 5 to this series
>>>> Changes in v3:
>>>>   - v2 can't fix the problem thoroughly, add patch 3-4 to this series.
>>>>   - modify descriptions.
>>>>   - patch 5 is just a cleanup
>>>> Changes in v2:
>>>>   - as Bart suggested, add a new helper function for drivers to get
>>>>   request by tag.
>>>>
>>>> Yu Kuai (7):
>>>>    nbd: don't handle response without a corresponding request message
>>>>    nbd: make sure request completion won't concurrent
>>>>    nbd: check sock index in nbd_read_stat()
>>>>    nbd: don't start request if nbd_queue_rq() failed
>>>>    nbd: clean up return value checking of sock_xmit()
>>>>    nbd: partition nbd_read_stat() into nbd_read_reply() and
>>>>      nbd_handle_reply()
>>>>    nbd: fix uaf in nbd_handle_reply()
>>>>
>>>>   drivers/block/nbd.c | 135 
>>>> +++++++++++++++++++++++++++++++-------------
>>>>   1 file changed, 96 insertions(+), 39 deletions(-)
>>>>

