Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D613E3811
	for <lists+nbd@lfdr.de>; Sun,  8 Aug 2021 05:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8EB29203CA; Sun,  8 Aug 2021 03:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug  8 03:18:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E83462041D
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Aug 2021 03:01:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5dMSDiluFLHi for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Aug 2021 03:01:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2E2CF2040A
	for <nbd@other.debian.org>; Sun,  8 Aug 2021 03:01:17 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gj3PM0krvz1CTTX;
	Sun,  8 Aug 2021 10:41:11 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 8 Aug 2021 10:41:21 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sun, 8 Aug 2021 10:41:21 +0800
Subject: Re: [PATCH] nbd: hold tags->lock to prevent access freed request
 through blk_mq_tag_to_rq()
To: kernel test robot <lkp@intel.com>, <josef@toxicpanda.com>,
	<axboe@kernel.dk>
CC: <kbuild-all@lists.01.org>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, <linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20210806094458.2330093-1-yukuai3@huawei.com>
 <202108070119.2axrpD1B-lkp@intel.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <2bbf7e4a-19da-cd2e-2508-1aa4ea99bf12@huawei.com>
Date: Sun, 8 Aug 2021 10:41:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <202108070119.2axrpD1B-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <m3TRF01OUyG.A.ngG.yz0DhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1246
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2bbf7e4a-19da-cd2e-2508-1aa4ea99bf12@huawei.com
Resent-Date: Sun,  8 Aug 2021 03:18:10 +0000 (UTC)

On 2021/08/07 2:05, kernel test robot wrote:
> Hi Yu,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on block/for-next]
> [also build test ERROR on v5.14-rc4 next-20210805]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Yu-Kuai/nbd-hold-tags-lock-to-prevent-access-freed-request-through-blk_mq_tag_to_rq/20210806-173619
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
> config: ia64-randconfig-r025-20210804 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/8fe3c93026bf70921973f34fd9dc2bcf4ca2ccf0
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Yu-Kuai/nbd-hold-tags-lock-to-prevent-access-freed-request-through-blk_mq_tag_to_rq/20210806-173619
>          git checkout 8fe3c93026bf70921973f34fd9dc2bcf4ca2ccf0
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/wait.h:9,
>                      from include/linux/pid.h:6,
>                      from include/linux/sched.h:14,
>                      from include/linux/blkdev.h:5,
>                      from drivers/block/nbd.c:16:
>     drivers/block/nbd.c: In function 'nbd_read_stat':
>>> drivers/block/nbd.c:719:26: error: invalid use of undefined type 'struct blk_mq_tags'
>       719 |   spin_lock_irqsave(&tags->lock, flags);
>           |                          ^~

My apologize that I forgot to enable nbd conifg while compiling this
patch in my local enviroment.

Thanks
Kuai
>     include/linux/spinlock.h:252:34: note: in definition of macro 'raw_spin_lock_irqsave'
>       252 |   flags = _raw_spin_lock_irqsave(lock); \
>           |                                  ^~~~
>     drivers/block/nbd.c:719:3: note: in expansion of macro 'spin_lock_irqsave'
>       719 |   spin_lock_irqsave(&tags->lock, flags);
>           |   ^~~~~~~~~~~~~~~~~
>     drivers/block/nbd.c:726:31: error: invalid use of undefined type 'struct blk_mq_tags'
>       726 |   spin_unlock_irqrestore(&tags->lock, flags);
>           |                               ^~
> 
> 
> vim +719 drivers/block/nbd.c
> 
>     680	
>     681	/* NULL returned = something went wrong, inform userspace */
>     682	static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>     683	{
>     684		struct nbd_config *config = nbd->config;
>     685		int result;
>     686		struct nbd_reply reply;
>     687		struct nbd_cmd *cmd;
>     688		struct request *req = NULL;
>     689		u64 handle;
>     690		u16 hwq;
>     691		u32 tag;
>     692		struct kvec iov = {.iov_base = &reply, .iov_len = sizeof(reply)};
>     693		struct iov_iter to;
>     694		int ret = 0;
>     695	
>     696		reply.magic = 0;
>     697		iov_iter_kvec(&to, READ, &iov, 1, sizeof(reply));
>     698		result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
>     699		if (result <= 0) {
>     700			if (!nbd_disconnected(config))
>     701				dev_err(disk_to_dev(nbd->disk),
>     702					"Receive control failed (result %d)\n", result);
>     703			return ERR_PTR(result);
>     704		}
>     705	
>     706		if (ntohl(reply.magic) != NBD_REPLY_MAGIC) {
>     707			dev_err(disk_to_dev(nbd->disk), "Wrong magic (0x%lx)\n",
>     708					(unsigned long)ntohl(reply.magic));
>     709			return ERR_PTR(-EPROTO);
>     710		}
>     711	
>     712		memcpy(&handle, reply.handle, sizeof(handle));
>     713		tag = nbd_handle_to_tag(handle);
>     714		hwq = blk_mq_unique_tag_to_hwq(tag);
>     715		if (hwq < nbd->tag_set.nr_hw_queues) {
>     716			unsigned long flags;
>     717			struct blk_mq_tags *tags = nbd->tag_set.tags[hwq];
>     718	
>   > 719			spin_lock_irqsave(&tags->lock, flags);
>     720			req = blk_mq_tag_to_rq(tags, blk_mq_unique_tag_to_tag(tag));
>     721			if (!blk_mq_request_started(req)) {
>     722				dev_err(disk_to_dev(nbd->disk), "Request not started (%d) %p\n",
>     723					tag, req);
>     724				req = NULL;
>     725			}
>     726			spin_unlock_irqrestore(&tags->lock, flags);
>     727		}
>     728	
>     729		if (!req) {
>     730			dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d)\n", tag);
>     731			return ERR_PTR(-ENOENT);
>     732		}
>     733		trace_nbd_header_received(req, handle);
>     734		cmd = blk_mq_rq_to_pdu(req);
>     735	
>     736		mutex_lock(&cmd->lock);
>     737		if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
>     738			dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
>     739				req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
>     740			ret = -ENOENT;
>     741			goto out;
>     742		}
>     743		if (cmd->status != BLK_STS_OK) {
>     744			dev_err(disk_to_dev(nbd->disk), "Command already handled %p\n",
>     745				req);
>     746			ret = -ENOENT;
>     747			goto out;
>     748		}
>     749		if (test_bit(NBD_CMD_REQUEUED, &cmd->flags)) {
>     750			dev_err(disk_to_dev(nbd->disk), "Raced with timeout on req %p\n",
>     751				req);
>     752			ret = -ENOENT;
>     753			goto out;
>     754		}
>     755		if (ntohl(reply.error)) {
>     756			dev_err(disk_to_dev(nbd->disk), "Other side returned error (%d)\n",
>     757				ntohl(reply.error));
>     758			cmd->status = BLK_STS_IOERR;
>     759			goto out;
>     760		}
>     761	
>     762		dev_dbg(nbd_to_dev(nbd), "request %p: got reply\n", req);
>     763		if (rq_data_dir(req) != WRITE) {
>     764			struct req_iterator iter;
>     765			struct bio_vec bvec;
>     766	
>     767			rq_for_each_segment(bvec, req, iter) {
>     768				iov_iter_bvec(&to, READ, &bvec, 1, bvec.bv_len);
>     769				result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
>     770				if (result <= 0) {
>     771					dev_err(disk_to_dev(nbd->disk), "Receive data failed (result %d)\n",
>     772						result);
>     773					/*
>     774					 * If we've disconnected, we need to make sure we
>     775					 * complete this request, otherwise error out
>     776					 * and let the timeout stuff handle resubmitting
>     777					 * this request onto another connection.
>     778					 */
>     779					if (nbd_disconnected(config)) {
>     780						cmd->status = BLK_STS_IOERR;
>     781						goto out;
>     782					}
>     783					ret = -EIO;
>     784					goto out;
>     785				}
>     786				dev_dbg(nbd_to_dev(nbd), "request %p: got %d bytes data\n",
>     787					req, bvec.bv_len);
>     788			}
>     789		}
>     790	out:
>     791		trace_nbd_payload_received(req, handle);
>     792		mutex_unlock(&cmd->lock);
>     793		return ret ? ERR_PTR(ret) : cmd;
>     794	}
>     795	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

