Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA786B635A
	for <lists+nbd@lfdr.de>; Sun, 12 Mar 2023 06:36:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 33AC920623; Sun, 12 Mar 2023 05:36:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar 12 05:36:14 2023
Old-Return-Path: <lkp@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	MDO_CABLE_TV3,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E88D5205AB
	for <lists-other-nbd@bendel.debian.org>; Sun, 12 Mar 2023 05:20:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.879 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1, MDO_CABLE_TV3=0.5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BglNKSpf8TVB for <lists-other-nbd@bendel.debian.org>;
	Sun, 12 Mar 2023 05:20:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 441 seconds by postgrey-1.36 at bendel; Sun, 12 Mar 2023 05:20:42 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "fmsmga101.fm.intel.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BC35A205AD
	for <nbd@other.debian.org>; Sun, 12 Mar 2023 05:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678598442; x=1710134442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2tdRpSuMRaDaRBUHSXUSd/IiKyotGE0EDCaRbWdcOLw=;
  b=dldioy8sOOBs6QH+gxzFwMF2511yr3YLgbpzfuRiSpSDXyfHztrVvduq
   /CZu8+2uYumDc/1PlYW13rTa+Hfx+a+fikmpQL2L/p2Igi9WVdfYSaBOc
   RzXo1+k4BxOnnuMns31TlLuYW8QuRj+XrBVuDjc9KrK0Gh3QyMfj2duSd
   SRMzc7AnbJV14iuN6se1uXzWLx5kkIMPVNflOTuwkg/eZgK+BDzH0PUbm
   aFY1Zeh0zCDbt86wQ4SqzL2mg/uW8A8IFRxR5yXdZhB2WBjvOaORpPCzJ
   lGyt2RB/xLzUD6I1sSB5sw7cnV9VEYCM7nGgtiIy4egJSJzY1rtTQwFj2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="364620212"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="364620212"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 21:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="852365373"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="852365373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Mar 2023 21:13:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbE19-0004zw-0f;
	Sun, 12 Mar 2023 05:13:11 +0000
Date: Sun, 12 Mar 2023 13:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Blake <eblake@redhat.com>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org
Cc: oe-kbuild-all@lists.linux.dev, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
	corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] block nbd: use req.cookie instead of req.handle
Message-ID: <202303121323.Jd35Q1Au-lkp@intel.com>
References: <20230310201525.2615385-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310201525.2615385-4-eblake@redhat.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mSloal2eZkB.A.KbE.OTWDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2383
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/202303121323.Jd35Q1Au-lkp@intel.com
Resent-Date: Sun, 12 Mar 2023 05:36:14 +0000 (UTC)

Hi Eric,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Blake/uapi-nbd-improve-doc-links-to-userspace-spec/20230311-041759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230310201525.2615385-4-eblake%40redhat.com
patch subject: [PATCH 3/3] block nbd: use req.cookie instead of req.handle
config: loongarch-randconfig-s052-20230310 (https://download.01.org/0day-ci/archive/20230312/202303121323.Jd35Q1Au-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/ee3462cd07240f936d4a304b8b7da8c1d610e2af
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-Blake/uapi-nbd-improve-doc-links-to-userspace-spec/20230311-041759
        git checkout ee3462cd07240f936d4a304b8b7da8c1d610e2af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121323.Jd35Q1Au-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/nbd.c:609:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [addressable] [assigned] [usertype] cookie @@     got unsigned long long [assigned] [usertype] handle @@
   drivers/block/nbd.c:609:24: sparse:     expected restricted __be64 [addressable] [assigned] [usertype] cookie
   drivers/block/nbd.c:609:24: sparse:     got unsigned long long [assigned] [usertype] handle
   drivers/block/nbd.c:631:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/block/nbd.c:631:32: sparse:     expected int
   drivers/block/nbd.c:631:32: sparse:     got restricted blk_status_t [usertype]
   drivers/block/nbd.c:672:48: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/block/nbd.c:672:48: sparse:     expected int
   drivers/block/nbd.c:672:48: sparse:     got restricted blk_status_t [usertype]
>> drivers/block/nbd.c:735:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] handle @@     got restricted __be64 [usertype] cookie @@
   drivers/block/nbd.c:735:16: sparse:     expected unsigned long long [usertype] handle
   drivers/block/nbd.c:735:16: sparse:     got restricted __be64 [usertype] cookie
   drivers/block/nbd.c:1077:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted blk_status_t [usertype] @@
   drivers/block/nbd.c:1077:21: sparse:     expected int [assigned] ret
   drivers/block/nbd.c:1077:21: sparse:     got restricted blk_status_t [usertype]
   drivers/block/nbd.c:1082:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int [assigned] ret @@
   drivers/block/nbd.c:1082:16: sparse:     expected restricted blk_status_t
   drivers/block/nbd.c:1082:16: sparse:     got int [assigned] ret

vim +609 drivers/block/nbd.c

   549	
   550	/* always call with the tx_lock held */
   551	static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
   552	{
   553		struct request *req = blk_mq_rq_from_pdu(cmd);
   554		struct nbd_config *config = nbd->config;
   555		struct nbd_sock *nsock = config->socks[index];
   556		int result;
   557		struct nbd_request request = {.magic = htonl(NBD_REQUEST_MAGIC)};
   558		struct kvec iov = {.iov_base = &request, .iov_len = sizeof(request)};
   559		struct iov_iter from;
   560		unsigned long size = blk_rq_bytes(req);
   561		struct bio *bio;
   562		u64 handle;
   563		u32 type;
   564		u32 nbd_cmd_flags = 0;
   565		int sent = nsock->sent, skip = 0;
   566	
   567		iov_iter_kvec(&from, ITER_SOURCE, &iov, 1, sizeof(request));
   568	
   569		type = req_to_nbd_cmd_type(req);
   570		if (type == U32_MAX)
   571			return -EIO;
   572	
   573		if (rq_data_dir(req) == WRITE &&
   574		    (config->flags & NBD_FLAG_READ_ONLY)) {
   575			dev_err_ratelimited(disk_to_dev(nbd->disk),
   576					    "Write on read-only\n");
   577			return -EIO;
   578		}
   579	
   580		if (req->cmd_flags & REQ_FUA)
   581			nbd_cmd_flags |= NBD_CMD_FLAG_FUA;
   582	
   583		/* We did a partial send previously, and we at least sent the whole
   584		 * request struct, so just go and send the rest of the pages in the
   585		 * request.
   586		 */
   587		if (sent) {
   588			if (sent >= sizeof(request)) {
   589				skip = sent - sizeof(request);
   590	
   591				/* initialize handle for tracing purposes */
   592				handle = nbd_cmd_handle(cmd);
   593	
   594				goto send_pages;
   595			}
   596			iov_iter_advance(&from, sent);
   597		} else {
   598			cmd->cmd_cookie++;
   599		}
   600		cmd->index = index;
   601		cmd->cookie = nsock->cookie;
   602		cmd->retries = 0;
   603		request.type = htonl(type | nbd_cmd_flags);
   604		if (type != NBD_CMD_FLUSH) {
   605			request.from = cpu_to_be64((u64)blk_rq_pos(req) << 9);
   606			request.len = htonl(size);
   607		}
   608		handle = nbd_cmd_handle(cmd);
 > 609		request.cookie = handle;
   610	
   611		trace_nbd_send_request(&request, nbd->index, blk_mq_rq_from_pdu(cmd));
   612	
   613		dev_dbg(nbd_to_dev(nbd), "request %p: sending control (%s@%llu,%uB)\n",
   614			req, nbdcmd_to_ascii(type),
   615			(unsigned long long)blk_rq_pos(req) << 9, blk_rq_bytes(req));
   616		result = sock_xmit(nbd, index, 1, &from,
   617				(type == NBD_CMD_WRITE) ? MSG_MORE : 0, &sent);
   618		trace_nbd_header_sent(req, handle);
   619		if (result < 0) {
   620			if (was_interrupted(result)) {
   621				/* If we havne't sent anything we can just return BUSY,
   622				 * however if we have sent something we need to make
   623				 * sure we only allow this req to be sent until we are
   624				 * completely done.
   625				 */
   626				if (sent) {
   627					nsock->pending = req;
   628					nsock->sent = sent;
   629				}
   630				set_bit(NBD_CMD_REQUEUED, &cmd->flags);
   631				return BLK_STS_RESOURCE;
   632			}
   633			dev_err_ratelimited(disk_to_dev(nbd->disk),
   634				"Send control failed (result %d)\n", result);
   635			return -EAGAIN;
   636		}
   637	send_pages:
   638		if (type != NBD_CMD_WRITE)
   639			goto out;
   640	
   641		bio = req->bio;
   642		while (bio) {
   643			struct bio *next = bio->bi_next;
   644			struct bvec_iter iter;
   645			struct bio_vec bvec;
   646	
   647			bio_for_each_segment(bvec, bio, iter) {
   648				bool is_last = !next && bio_iter_last(bvec, iter);
   649				int flags = is_last ? 0 : MSG_MORE;
   650	
   651				dev_dbg(nbd_to_dev(nbd), "request %p: sending %d bytes data\n",
   652					req, bvec.bv_len);
   653				iov_iter_bvec(&from, ITER_SOURCE, &bvec, 1, bvec.bv_len);
   654				if (skip) {
   655					if (skip >= iov_iter_count(&from)) {
   656						skip -= iov_iter_count(&from);
   657						continue;
   658					}
   659					iov_iter_advance(&from, skip);
   660					skip = 0;
   661				}
   662				result = sock_xmit(nbd, index, 1, &from, flags, &sent);
   663				if (result < 0) {
   664					if (was_interrupted(result)) {
   665						/* We've already sent the header, we
   666						 * have no choice but to set pending and
   667						 * return BUSY.
   668						 */
   669						nsock->pending = req;
   670						nsock->sent = sent;
   671						set_bit(NBD_CMD_REQUEUED, &cmd->flags);
   672						return BLK_STS_RESOURCE;
   673					}
   674					dev_err(disk_to_dev(nbd->disk),
   675						"Send data failed (result %d)\n",
   676						result);
   677					return -EAGAIN;
   678				}
   679				/*
   680				 * The completion might already have come in,
   681				 * so break for the last one instead of letting
   682				 * the iterator do it. This prevents use-after-free
   683				 * of the bio.
   684				 */
   685				if (is_last)
   686					break;
   687			}
   688			bio = next;
   689		}
   690	out:
   691		trace_nbd_payload_sent(req, handle);
   692		nsock->pending = NULL;
   693		nsock->sent = 0;
   694		return 0;
   695	}
   696	
   697	static int nbd_read_reply(struct nbd_device *nbd, int index,
   698				  struct nbd_reply *reply)
   699	{
   700		struct kvec iov = {.iov_base = reply, .iov_len = sizeof(*reply)};
   701		struct iov_iter to;
   702		int result;
   703	
   704		reply->magic = 0;
   705		iov_iter_kvec(&to, ITER_DEST, &iov, 1, sizeof(*reply));
   706		result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
   707		if (result < 0) {
   708			if (!nbd_disconnected(nbd->config))
   709				dev_err(disk_to_dev(nbd->disk),
   710					"Receive control failed (result %d)\n", result);
   711			return result;
   712		}
   713	
   714		if (ntohl(reply->magic) != NBD_REPLY_MAGIC) {
   715			dev_err(disk_to_dev(nbd->disk), "Wrong magic (0x%lx)\n",
   716					(unsigned long)ntohl(reply->magic));
   717			return -EPROTO;
   718		}
   719	
   720		return 0;
   721	}
   722	
   723	/* NULL returned = something went wrong, inform userspace */
   724	static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
   725						struct nbd_reply *reply)
   726	{
   727		int result;
   728		struct nbd_cmd *cmd;
   729		struct request *req = NULL;
   730		u64 handle;
   731		u16 hwq;
   732		u32 tag;
   733		int ret = 0;
   734	
 > 735		handle = reply->cookie;
   736		tag = nbd_handle_to_tag(handle);
   737		hwq = blk_mq_unique_tag_to_hwq(tag);
   738		if (hwq < nbd->tag_set.nr_hw_queues)
   739			req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
   740					       blk_mq_unique_tag_to_tag(tag));
   741		if (!req || !blk_mq_request_started(req)) {
   742			dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
   743				tag, req);
   744			return ERR_PTR(-ENOENT);
   745		}
   746		trace_nbd_header_received(req, handle);
   747		cmd = blk_mq_rq_to_pdu(req);
   748	
   749		mutex_lock(&cmd->lock);
   750		if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
   751			dev_err(disk_to_dev(nbd->disk), "Suspicious reply %d (status %u flags %lu)",
   752				tag, cmd->status, cmd->flags);
   753			ret = -ENOENT;
   754			goto out;
   755		}
   756		if (cmd->index != index) {
   757			dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d from different sock %d (expected %d)",
   758				tag, index, cmd->index);
   759			ret = -ENOENT;
   760			goto out;
   761		}
   762		if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
   763			dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
   764				req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
   765			ret = -ENOENT;
   766			goto out;
   767		}
   768		if (cmd->status != BLK_STS_OK) {
   769			dev_err(disk_to_dev(nbd->disk), "Command already handled %p\n",
   770				req);
   771			ret = -ENOENT;
   772			goto out;
   773		}
   774		if (test_bit(NBD_CMD_REQUEUED, &cmd->flags)) {
   775			dev_err(disk_to_dev(nbd->disk), "Raced with timeout on req %p\n",
   776				req);
   777			ret = -ENOENT;
   778			goto out;
   779		}
   780		if (ntohl(reply->error)) {
   781			dev_err(disk_to_dev(nbd->disk), "Other side returned error (%d)\n",
   782				ntohl(reply->error));
   783			cmd->status = BLK_STS_IOERR;
   784			goto out;
   785		}
   786	
   787		dev_dbg(nbd_to_dev(nbd), "request %p: got reply\n", req);
   788		if (rq_data_dir(req) != WRITE) {
   789			struct req_iterator iter;
   790			struct bio_vec bvec;
   791			struct iov_iter to;
   792	
   793			rq_for_each_segment(bvec, req, iter) {
   794				iov_iter_bvec(&to, ITER_DEST, &bvec, 1, bvec.bv_len);
   795				result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
   796				if (result < 0) {
   797					dev_err(disk_to_dev(nbd->disk), "Receive data failed (result %d)\n",
   798						result);
   799					/*
   800					 * If we've disconnected, we need to make sure we
   801					 * complete this request, otherwise error out
   802					 * and let the timeout stuff handle resubmitting
   803					 * this request onto another connection.
   804					 */
   805					if (nbd_disconnected(nbd->config)) {
   806						cmd->status = BLK_STS_IOERR;
   807						goto out;
   808					}
   809					ret = -EIO;
   810					goto out;
   811				}
   812				dev_dbg(nbd_to_dev(nbd), "request %p: got %d bytes data\n",
   813					req, bvec.bv_len);
   814			}
   815		}
   816	out:
   817		trace_nbd_payload_received(req, handle);
   818		mutex_unlock(&cmd->lock);
   819		return ret ? ERR_PTR(ret) : cmd;
   820	}
   821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

